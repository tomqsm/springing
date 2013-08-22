package biz.letsweb.lukasfloorspring;

import com.thoughtworks.selenium.DefaultSelenium;
import com.thoughtworks.selenium.Selenium;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author Tomasz
 */
public class IndexControllerTest {

    private Selenium selBrowser;

    public IndexControllerTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        selBrowser = new DefaultSelenium("localhost", 4444, "*firefox", "http://localhost:8080/lukasfloorspring");
        selBrowser.start();
    }

    @After
    public void tearDown() {
        selBrowser.stop();
    }

    /**
     * Test of sayHello method, of class IndexController.
     */
    @Test
    public void testSayHello() throws InterruptedException {
        selBrowser.open("/index?lang=en");
        selBrowser.waitForPageToLoad("90000");
        final String cookieByName = selBrowser.getCookie();
        Assert.assertNotNull(cookieByName);
        selBrowser.open("/index?lang=pl");
        selBrowser.waitForPageToLoad("90000");
        System.out.println("cookies: " + cookieByName);
        Assert.assertTrue("cookie should be present", selBrowser.isCookiePresent("locale"));
    }
}