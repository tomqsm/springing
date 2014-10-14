package biz.letsweb.lukasfloorspring;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.security.crypto.codec.Base64;

/**
 *
 * @author toks
 */
public class DevelopmentSupportTest {
    
    public DevelopmentSupportTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

     @Test
     public void base64Test() {
         String test = "tak";
         byte [] encodedTest = Base64.encode(test.getBytes());
         System.out.println("encoded: " + new String(encodedTest));
         System.out.println("decoded: " + Base64.decode(encodedTest));
     }
}
