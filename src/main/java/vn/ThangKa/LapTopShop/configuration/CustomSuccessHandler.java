package vn.ThangKa.LapTopShop.configuration;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import vn.ThangKa.LapTopShop.domain.User;
import vn.ThangKa.LapTopShop.service.CustomUserDetailsService;
import vn.ThangKa.LapTopShop.service.UserService;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {



    private UserService userService;
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    public CustomSuccessHandler(UserService userService) {
        this.userService = userService;
    }


    protected String determineTargetUrl(final Authentication authentication) {

        Map<String, String> roleTargetUrlMap = new HashMap<>();
        roleTargetUrlMap.put("ROLE_USER", "/");
        roleTargetUrlMap.put("ROLE_ADMIN", "/admin");

        final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (final GrantedAuthority grantedAuthority : authorities) {
            String authorityName = grantedAuthority.getAuthority();
            if(roleTargetUrlMap.containsKey(authorityName)) {
                return roleTargetUrlMap.get(authorityName);
            }
        }

        throw new IllegalStateException();
    }
    protected void clearAuthenticationAttributes(HttpServletRequest request,Authentication authentication) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        //getemail
        String email = authentication.getName();
        //get user
        User user = this.userService.findByEmail(email);

        session.setAttribute("fullName",user.getFullName());
        session.setAttribute("avatar",user.getAvatar());
        session.setAttribute("email",user.getEmail());
        session.setAttribute("id",user.getId());

        int sum = user.getCart()==null?0:user.getCart().getSum();
        session.setAttribute("sum", sum);


    }
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String targetUrl = determineTargetUrl(authentication);

        if (response.isCommitted()) {

            return;
        }

        redirectStrategy.sendRedirect(request, response, targetUrl);
        clearAuthenticationAttributes(request,authentication);
    }
}
