package vn.ThangKa.LapTopShop.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vn.ThangKa.LapTopShop.domain.dto.registerDTO;
import vn.ThangKa.LapTopShop.service.UserService;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, registerDTO> {

    @Autowired
    private UserService userService;

    @Override
    public boolean isValid(registerDTO user, ConstraintValidatorContext context) {
        boolean isValid = true;
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Passwords must match")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            isValid = false;
        }
        if (userService.existsByEmail(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email already exists")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            isValid = false;
        }


        return isValid;
    }
}
