package vn.ThangKa.LapTopShop.service.Specification;

import org.springframework.data.jpa.domain.Specification;
import vn.ThangKa.LapTopShop.domain.Product;
import vn.ThangKa.LapTopShop.domain.Product_;

import java.util.List;
import java.util.Optional;

public class ProductSpecs {


    public static Specification<Product> nameLike(String name) {
        return ((root, query, criteriaBuilder) ->
                criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%"));
    }

    public static Specification<Product> matchListFactory(List<String> factory) {
        return ((root, query, criteriaBuilder) ->
                criteriaBuilder.in(root.get(Product_.FACTORY)).value(factory));
    }
    public static Specification<Product> matchListTarGet(List<String> target) {
        return ((root, query, criteriaBuilder) ->
                criteriaBuilder.in(root.get(Product_.TARGET)).value(target));
    }
    public static Specification<Product> matchPrice(double min,double max) {
        return ((root, query, criteriaBuilder) ->
                criteriaBuilder.between(root.get(Product_.PRICE),min,max));
    }



}
