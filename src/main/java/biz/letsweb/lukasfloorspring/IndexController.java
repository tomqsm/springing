package biz.letsweb.lukasfloorspring;

import java.util.Date;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = {"/"})
public class IndexController {

    final Logger logger = LoggerFactory.getLogger(IndexController.class);
    public static final String VIEW_NAME = "index";
    @Autowired
    private JdbcUsersDao usersDao;
    @Autowired
    private MessageSource messageSource;
//    @Autowired
//    private SessionContainer sessionContainer;
    private String requestString;

    @RequestMapping(method = RequestMethod.GET)
    public String sayHello(ModelMap model, Locale locale) {
//        final User user = usersDao.findUserById(1);
//        logger.info("In method ... ");
        model.addAttribute("date", new Date());
//        model.addAttribute("user", user);
        final String message = messageSource.getMessage("welcome", new Object[]{}, locale);
        logger.info("message: {}", message);
        model.addAttribute("message", new Message("myMessage", message));
//        sessionContainer.setSessionString("tomasz");
        requestString = "set in index";
        return VIEW_NAME;
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String goAdmin(ModelMap model) {
        final User user = usersDao.findUserById(1);
//        logger.info("In method ... ");
        model.addAttribute("date", new Date());
        model.addAttribute("user", user);
        return "index/admin";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String goLogin(ModelMap model) {
        final User user = usersDao.findUserById(1);
//        logger.info("In method ... ");
        model.addAttribute("date", new Date());
        model.addAttribute("user", user);
//        System.out.println(sessionContainer.getSessionString());
        System.out.println(requestString);

        return "index/login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String goLogout(ModelMap model) {
        final User user = usersDao.findUserById(1);
//        logger.info("In method ... ");
        model.addAttribute("date", new Date());
        model.addAttribute("user", user);
        return "index/logout";
    }

    @RequestMapping(value = "/login/failed", method = RequestMethod.GET)
    public String goLoginFailed(ModelMap model) {
        final User user = usersDao.findUserById(1);
//        logger.info("In method ... ");
        model.addAttribute("date", new Date());
        model.addAttribute("user", user);
        return "forward:/index/login";
    }
}
