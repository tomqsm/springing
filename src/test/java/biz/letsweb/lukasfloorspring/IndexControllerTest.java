package biz.letsweb.lukasfloorspring;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.mockito.InjectMocks;
import static org.mockito.Matchers.any;
import org.mockito.Mock;
import static org.mockito.Mockito.when;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

public class IndexControllerTest {

  public IndexControllerTest() {}

  @InjectMocks
  IndexController controller;
  @Mock
  JdbcUsersDao jdbcUsersDao;
  MockMvc mockMvc;

  @BeforeClass
  public static void setUpClass() {}

  @AfterClass
  public static void tearDownClass() {}

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    this.mockMvc =
        MockMvcBuilders.standaloneSetup(controller)
            .setMessageConverters(new MappingJackson2HttpMessageConverter()).build();
  }

  @After
  public void tearDown() {}

  /**
   * Test of sayHello method, of class IndexController. https://spring.io/guides/tutorials/rest/2/
   */
  @Test
  public void testSayHello() throws Exception {
    when(jdbcUsersDao.findUserById(any(Integer.class))).thenReturn(null);
    this.mockMvc
        .perform(get("/rest5/{testString}", "{\"test\":test}").accept(MediaType.APPLICATION_JSON))
        .andDo(print()).andExpect(status().isNotFound());
  }

  @Test
  public void testSayHelloAgain() throws Exception {
    when(jdbcUsersDao.findUserById(any(Integer.class))).thenReturn(null);
    this.mockMvc.perform(get("/rest/{testString}", "{\"test\":test}").accept(MediaType.TEXT_PLAIN))
        .andExpect(jsonPath("\"$.test['\" test \"']\"").value("test"));
  }
}
