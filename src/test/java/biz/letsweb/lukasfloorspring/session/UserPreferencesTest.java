package biz.letsweb.lukasfloorspring.session;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = ScopeConfiguration.class)
// @ContextConfiguration("servlet-context.xml")
@WebAppConfiguration
public class UserPreferencesTest {

  public UserPreferencesTest() {}

  @Autowired
  private WebApplicationContext wac;
  private MockMvc mockMvc;

  @Before
  public void setup() {
    this.mockMvc = webAppContextSetup(this.wac).build();
  }

  @Test
  public void testSessionScope() throws Exception {
    MockHttpSession mocksession = new MockHttpSession();
    this.mockMvc.perform(
        get("/user/setuserprefs?timeZoneId={timeZoneId}", "US/Pacific").session(mocksession))
        .andExpect(model().attribute("timeZone", "US/Pacific"));

    this.mockMvc.perform(get("/user/gotopage?page={page}", "home").session(mocksession)).andExpect(
        model().attribute("timeZone", "US/Pacific"));

    this.mockMvc.perform(get("/user/gotopage?page={page}", "home").session(new MockHttpSession()))
        .andExpect(model().attribute("timeZone", "default"));
  }

}
