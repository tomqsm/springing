package biz.letsweb.lukasfloorspring;

import biz.letsweb.lukasfloorspring.dataaccess.JdbcUsersDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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



  @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
  public String changeLocale(@PathVariable(value = "id") int id) {
    logger.info("will delete id {}", id);
    usersDao.deleteById(id);
    return "redirect:/";
  }

  public void setMyMessage(Message myMessage) {
    this.myMessage = myMessage;
  }
}
