package biz.letsweb.lukasfloorspring;

import biz.letsweb.lukasfloorspring.dataaccess.dao.JdbcUsersDao;
import biz.letsweb.lukasfloorspring.session.UserPreferences;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = {"/user"})
public class UserController {

  final Logger logger = LoggerFactory.getLogger(UserController.class);
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
  @Autowired
  private UserPreferences userPreferences;



  @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
  public String delete(@PathVariable(value = "id") int id) {
    logger.info("will delete id {}", id);
    usersDao.deleteById(id);
    return "redirect:/";
  }

  @RequestMapping(value = "/setuserprefs")
  public String setUserPrefs(@RequestParam("timeZoneId") String timeZoneId, Model model) {
    userPreferences.setTimeZoneId(timeZoneId);
    model.addAttribute("timeZone", userPreferences.getTimeZoneId());
    return "preferences";
  }

  @RequestMapping(value = "/gotopage")
  public String goToPage(@RequestParam("page") String page, Model model) {
    model.addAttribute("timeZone", userPreferences.getTimeZoneId());
    return page;
  }

  public void setMyMessage(Message myMessage) {
    this.myMessage = myMessage;
  }
}
