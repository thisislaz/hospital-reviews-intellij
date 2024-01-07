package net.thisislaz.hospitalreviewsintellij.annotations;

import jakarta.validation.*;
import net.thisislaz.hospitalreviewsintellij.models.User;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.util.Set;

@Aspect
@Component
public class ValidationAspect {

    @Around("@annotation(conditionalValidation)")
    public Object validate(ProceedingJoinPoint joinPoint, ConditionalValidation conditionalValidation) throws Throwable {
        Object[] args = joinPoint.getArgs();
        for (Object arg : args) {
            if(arg instanceof User) {
                ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
                Validator validator = factory.getValidator();
                Set<ConstraintViolation<User>> violations = validator.validate((User) arg, conditionalValidation.groups()) ;
                if (!violations.isEmpty()) {
                    // handle violations as necesary
                    throw new ConstraintViolationException(violations);
                }
            }
        }
        return joinPoint.proceed();
    }

}
