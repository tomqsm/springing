package biz.letsweb.lukasfloorspring.session;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@EnableWebMvc
@ComponentScan({"scope.model", "scope.services", "scope.web"})
public class ScopeConfiguration {

}
