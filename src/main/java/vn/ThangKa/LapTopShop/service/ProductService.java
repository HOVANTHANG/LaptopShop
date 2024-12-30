package vn.ThangKa.LapTopShop.service;


import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import vn.ThangKa.LapTopShop.domain.*;
import vn.ThangKa.LapTopShop.domain.dto.ProductCriteriaDTO;
import vn.ThangKa.LapTopShop.repository.*;
import vn.ThangKa.LapTopShop.service.Specification.ProductSpecs;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CartDetailsRepository cartDetailsRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderDetailsRepository orderDetailsRepository;

    public Product createProduct(Product product) {
        return productRepository.save(product);
    }


    public Page<Product> fetchProductSpec(Pageable pageable, ProductCriteriaDTO productCriteriaDTO) {
       if(productCriteriaDTO.getFactory()==null && productCriteriaDTO.getPrice()==null
       &&productCriteriaDTO.getTarget()==null){
           this.productRepository.findAll(pageable);
       }
        Specification<Product> combinedSpec = Specification.where(null);
       if(productCriteriaDTO.getFactory()!=null && productCriteriaDTO.getFactory().isPresent()){
           Specification<Product> currenspec = ProductSpecs.matchListFactory(productCriteriaDTO.getFactory().get());
           combinedSpec=combinedSpec.and(currenspec);
       }
        if(productCriteriaDTO.getTarget()!=null && productCriteriaDTO.getTarget().isPresent()){
            Specification<Product> currenspec = ProductSpecs.matchListTarGet(productCriteriaDTO.getTarget().get());
            combinedSpec=combinedSpec.and(currenspec);
        }
        if(productCriteriaDTO.getPrice()!=null && productCriteriaDTO.getPrice().isPresent()){
            Specification<Product> currenspec = this.buildPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpec=combinedSpec.and(currenspec);
        }


        return this.productRepository.findAll(combinedSpec,pageable);
    }

    public static Specification<Product> buildPriceSpecification(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null);

        for(String p:price){
            double min=0;
            double max=0;
            switch (p){
                case "duoi-25-trieu":
                        min=1;
                        max=1000;
                        break;
                case "tu-25-40-trieu":
                    min=1000;
                    max=1500;
                    break;
                case "tu-40-50-trieu":
                    min=1500;
                    max=2000;
                    break;
                case "tren-50-trieu":
                    min=2000;
                    max=10000;
                    break;
            }
            if(min!=0 && max!=0){
                Specification<Product> currenspec = ProductSpecs.matchPrice(min,max);
                combinedSpec =combinedSpec.or(currenspec);

            }
        }
        return combinedSpec;
    }








    public Page<Product> fetchProduct(Pageable pageable) {

        return this.productRepository.findAll(pageable);
    }

    public Optional<Product> findById(Long id) {
        return productRepository.findById(id);
    }

    public Product updateProduct(Product product) {
        return productRepository.save(product);
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    public void handlerAddproduct(String email, Long productId,HttpSession session) {
        User user = this.userService.findByEmail(email);
        Cart cart = this.cartRepository.findByUser(user);
        if (user!=null){
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);
                cart=this.cartRepository.save(newCart);
            }
        }
        Product product = productRepository.findById(productId).get();
        if (product!=null){

            CartDetails oldCart = this.cartDetailsRepository.findByCartAndProduct(cart, product);
            if (oldCart==null) {
                CartDetails cartDetails = new CartDetails();
                cartDetails.setProduct(product);
                cartDetails.setCart(cart);
                cartDetails.setPrice(product.getPrice());
                cartDetails.setQuantity(1);

                int s = cart.getSum()+1;
                cart.setSum(s);
                this.cartDetailsRepository.save(cartDetails);
                session.setAttribute("sum",s);

            }else{
                oldCart.setQuantity(oldCart.getQuantity()+1);
                cartDetailsRepository.save(oldCart);
            }

        }
    }
    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public CartDetails fetchByID(Long id) {
            return  this.cartDetailsRepository.findById(id).get();
    }


    public void handlerDeleteCartDetails(long id, HttpSession session) {

        Optional<CartDetails> cartDetailsOptional = this.cartDetailsRepository.findById(id);
        if (cartDetailsOptional.isPresent()){
            CartDetails cartDetails = cartDetailsOptional.get();

            Cart cart = cartDetails.getCart();


            this.cartDetailsRepository.deleteById(id);

            if(cart.getSum()>1){
                int sum = cart.getSum() - 1;
                cart.setSum(sum);
                session.setAttribute("sum", sum);
                this.cartRepository.save(cart);
            }else {
                this.cartRepository.deleteById(cart.getId());
                session.setAttribute("sum", 0);
            }

        }


    }
    public void handlerCartBeforeCheckout(List<CartDetails> cartDetails) {
        for (CartDetails cartDetail : cartDetails) {
            Optional<CartDetails> cdOptional = this.cartDetailsRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()){
                CartDetails cd = cdOptional.get();
                cd.setQuantity(cartDetail.getQuantity());
                this.cartDetailsRepository.save(cd);
            }
        }


    }

    public void handlerPlaceOrder(User user,HttpSession session,
    String receiverName,String receiverAddress,String receiverPhone) {

    //create order_detail
    //step 1:get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart!=null){
            List<CartDetails> cartDetails = cart.getCart_details();
            if (cartDetails!=null){
                //create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");

                double sum=0;
                for (CartDetails cartDetail : cartDetails) {
                    sum+=cartDetail.getQuantity()* cartDetail.getPrice();
                }
                order.setTotalPrice(sum);
                order=this.orderRepository.save(order);

            for (CartDetails cd : cartDetails) {
                Order_detail orderDetail = new Order_detail();
                orderDetail.setOrder(order);
                orderDetail.setProduct(cd.getProduct());
                orderDetail.setQuantity(cd.getQuantity());
                orderDetail.setPrice(cd.getPrice());
                this.orderDetailsRepository.save(orderDetail);
            }
            //step 2: delete cart_detail and cart
                for (CartDetails cd : cartDetails) {
                    this.cartDetailsRepository.deleteById(cd.getId());
                }
                this.cartRepository.deleteById(cart.getId());

            //step 3: update session

            session.setAttribute("sum",0);

            }

        }















    }


}
