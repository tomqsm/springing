package biz.letsweb.lukasfloorspring.interceptors;

import biz.letsweb.lukasfloorspring.dataaccess.dao.JdbcIPLoggerDao;
import biz.letsweb.lukasfloorspring.dataaccess.model.IPLoggerLine;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class RequestIPInterceptor extends HandlerInterceptorAdapter {

  @Autowired
  private JdbcIPLoggerDao iploggerDao;

  public void init() {}

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView model) throws Exception {

    IPLoggerLine loggerLine = new IPLoggerLine();
    loggerLine.setIp(getClientIpAddr(request));
    loggerLine.setUrl(request.getRequestURL().toString());
    iploggerDao.insertRecord(loggerLine);
  }

  public void setIploggerDao(JdbcIPLoggerDao iploggerDao) {
    this.iploggerDao = iploggerDao;
  }

  public String getClientIpAddr(HttpServletRequest request) {
    String ip = request.getHeader("X-Forwarded-For");
    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
      ip = request.getHeader("Proxy-Client-IP");
    }
    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
      ip = request.getHeader("WL-Proxy-Client-IP");
    }
    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
      ip = request.getHeader("HTTP_CLIENT_IP");
    }
    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
      ip = request.getHeader("HTTP_X_FORWARDED_FOR");
    }
    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
      ip = request.getRemoteAddr();
    }
    System.out.println("XX" + ip);
    return ip;
  }
}
