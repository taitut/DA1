package com.fpoly.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.fpoly.securiry.CustomSuccessHandler;
import com.fpoly.services.Impl.CustomUserDetailsService;

@Configuration
@EnableWebSecurity

public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
    private CustomUserDetailsService userDetailsService;
 

	
	  @Bean public BCryptPasswordEncoder passwordEncoder() { BCryptPasswordEncoder
	  bCryptPasswordEncoder = new BCryptPasswordEncoder(); return
	  bCryptPasswordEncoder; }
	 
 
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
         // Sét đặt dịch vụ để tìm kiếm User trong Database.
        // Và sét đặt PasswordEncoder.
    	auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
 
    }
    
    @Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){
        return (AuthenticationSuccessHandler) new CustomSuccessHandler();
    }
 
    @Override
    protected void configure(final HttpSecurity http) throws Exception {
    	
    	http.csrf().disable();
    	
      
 
        // Các trang không yêu cầu login
 
    	 
        // Trang /userInfo yêu cầu phải login với vai trò ROLE_USER hoặc ROLE_ADMIN.
        // Nếu chưa login, nó sẽ redirect tới trang /login.
    	
        http.authorizeRequests().antMatchers("/trang-chu").permitAll();
        http.authorizeRequests().antMatchers("/admin/*/**").hasAuthority("ADMIN");
        http.authorizeRequests().antMatchers("/trang-chu/san-pham/checkout").authenticated();
        

        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/accessDenied");
        
        // Cấu hình cho Login Form.
        http.authorizeRequests().and().formLogin()//
                // Submit URL của trang login
                .loginProcessingUrl("/j_spring_security_check") // Submit URL
                .loginPage("/login")//
                
                .successHandler(myAuthenticationSuccessHandler())
                .failureUrl("/login?error=true")//
                .usernameParameter("username")//
                .passwordParameter("password")
                // Cấu hình cho Logout Page.
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/trang-chu").deleteCookies("JSESSIONID");
 
        // Cấu hình Remember Me.
        http.authorizeRequests().and() //
                .rememberMe().key("uniqueAndSecret").tokenValiditySeconds(1296000);
    }
 
	/*
	 * @Bean public PersistentTokenRepository persistentTokenRepository() {
	 * InMemoryTokenRepositoryImpl memory = new InMemoryTokenRepositoryImpl();
	 * return memory; }
	 */
}
