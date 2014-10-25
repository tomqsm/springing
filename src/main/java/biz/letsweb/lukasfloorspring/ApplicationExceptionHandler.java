package biz.letsweb.lukasfloorspring;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

/**
 * 
 * @author Tomasz
 */
@ControllerAdvice
public class ApplicationExceptionHandler extends ResponseEntityExceptionHandler {

  @Override
  protected ResponseEntity<Object> handleExceptionInternal(Exception ex, Object body,
      HttpHeaders headers, HttpStatus status, WebRequest request) {
    ResponseEntity<Object> responseEntity =
        super.handleExceptionInternal(ex, body, headers, status, request);
    System.out.println("My server error ... oh well...");
    return new ResponseEntity<Object>("My server error ... oh well...", headers,
        responseEntity.getStatusCode());
  }

}
