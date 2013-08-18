package biz.letsweb.lukasfloorspring;

import java.util.Date;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Tomasz
 */
@Controller
@RequestMapping(value = {IndexController.URL_MAPPING})
public class IndexController {

//    final Logger logger = LoggerFactory.getLogger(IndexController.class);
    public static final String URL_MAPPING = "/index";
    public static final String VIEW_NAME = "index";

    @RequestMapping(method = RequestMethod.GET)
    public String sayHello(ModelMap model) {
//        logger.info("In method ... ");
        model.addAttribute("date", new Date());
        return VIEW_NAME;
    }
}
