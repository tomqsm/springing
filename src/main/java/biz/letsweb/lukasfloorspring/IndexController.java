package biz.letsweb.lukasfloorspring;

import biz.letsweb.lukasfloorspring.dataaccess.JdbcUsersDao;
import biz.letsweb.lukasfloorspring.dataaccess.User;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = {"/"})
public class IndexController {

  final Logger logger = LoggerFactory.getLogger(IndexController.class);
  public static final String VIEW_NAME = "index";
  @Autowired
  private JdbcUsersDao usersDao;
  @Autowired
  private MessageSource messageSource;
  // @Autowired
  // private SessionContainer sessionContainer;
  private String requestString;
  @Autowired
  private Message myMessage;

  @RequestMapping(method = RequestMethod.GET)
  public String sayHello(ModelMap model, Locale locale) {
    final List<User> users = usersDao.findAll();
    logger.info("found ... " + users);
    model.addAttribute("date", new Date());
    // model.addAttribute("user", user);
    final String message = messageSource.getMessage("welcome", new Object[] {}, locale);
    logger.info("message: {}", message);
    myMessage.setMessage("myMessage");
    myMessage.setType(message);
    model.addAttribute("message", myMessage);
    model.addAttribute("users", users);
    // sessionContainer.setSessionString("tomasz");
    requestString = "set in index";
    return "index";
  }

  @PreAuthorize("isAuthenticated()")
  @RequestMapping(value = "/admin", method = RequestMethod.GET)
  public String goAdmin(ModelMap model) {
    final User user = usersDao.findUserById(1);
    // logger.info("In method ... ");
    model.addAttribute("date", new Date());
    model.addAttribute("user", user);
    return "index/admin";
  }

  @RequestMapping(value = "/cennik", method = RequestMethod.GET)
  public String goPricelist(ModelMap model) {
    return "cennik";
  }

  @RequestMapping(value = "/kontakt", method = RequestMethod.GET)
  public String goContact(ModelMap model) {
    return "kontakt";
  }

  @RequestMapping(value = "/firma", method = RequestMethod.GET)
  public String goFirm(ModelMap model) {
    return "firma";
  }

  @RequestMapping(value = "/404", method = RequestMethod.GET)
  public String error404(ModelMap model) {
    System.out.println("404");
    return "404";
  }

  @RequestMapping(value = "/ajax", method = RequestMethod.GET)
  // @RequestMapping(value = "/ajax", method = {RequestMethod.GET, RequestMethod.HEAD},
  // headers = "x-requested-with=XMLHttpRequest")
  public @ResponseBody
  AjaxModel ajax(ModelMap model) throws InterruptedException {
    AjaxModel am = new AjaxModel();
    // Thread.sleep(3000);
    am.name = "tomasz";
    am.staff = new String[] {"kibol1", "kibol2"};
    return am;
  }

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String goLogin(ModelMap model) {
    final User user = usersDao.findUserById(1);
    // logger.info("In method ... ");
    model.addAttribute("date", new Date());
    model.addAttribute("user", user);
    // System.out.println(sessionContainer.getSessionString());
    System.out.println(requestString);

    return "index/login";
  }

  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String goLogout(ModelMap model) {
    final User user = usersDao.findUserById(1);
    // logger.info("In method ... ");
    model.addAttribute("date", new Date());
    model.addAttribute("user", user);
    return "index/logout";
  }

  @RequestMapping(value = "/login/failed", method = RequestMethod.GET)
  public String goLoginFailed(ModelMap model) {
    final User user = usersDao.findUserById(1);
    // logger.info("In method ... ");
    model.addAttribute("date", new Date());
    model.addAttribute("user", user);
    return "forward:/index/login";
  }

  @RequestMapping(value = "/locale/{lang}")
  public void changeLocale(@PathVariable(value = "lang") String lang) {
    logger.info(lang);
  }

  public void setMyMessage(Message myMessage) {
    this.myMessage = myMessage;
  }
}
