package online_booking.bl.config;

import online_booking.bl.interceptor.TokenInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class InterceptorConfigurerAdapter extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        System.out.println("注册拦截器");
        registry.addInterceptor(new TokenInterceptor());
        super.addInterceptors(registry);
    }
}
