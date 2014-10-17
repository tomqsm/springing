package biz.letsweb.lukasfloorspring.interceptors;

import biz.letsweb.lukasfloorspring.dataaccess.dao.JdbcIPLoggerDao;
import biz.letsweb.lukasfloorspring.dataaccess.model.IPLoggerLine;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * This class is to discover client's IP, drop request if IP has been
 * blacklisted. The blacklisted are in database. Then they are loaded quick list
 * so you reduce hitting db on each request. Then they are checked, comparing IP
 * string and its source. If found incident is reported to IPLOGS db as blocked
 * coded 1.
 *
 * @author toks
 */
public class RequestIPInterceptor extends HandlerInterceptorAdapter {

    private final static String INTERCEPTED_IP_SOURCE = "interceptedIpSource";
    private final static String INTERCEPTED_IP = "0.0.0.0";
    private final static String PROXY_CLIENT_IP_SOURCE = "Proxy-Client-IP";
    private final static String WL_PROXY_CLIENT_IP_SOURCE = "WL-Proxy-Client-IP";
    private final static String HTTP_CLIENT_IP_SOURCE = "HTTP_CLIENT_IP";
    private final static String HTTP_X_FORWARDED_FOR_SOURCE = "HTTP_X_FORWARDED_FOR";
    private final static String X_FORWARDED_FOR_SOURCE = "X-Forwarded-For";
    private final static String UNKNOWN_SOURCE = "unknown";
    private final static int REQUEST_STOPPED = 1;
    private final static int REQUEST_NOT_STOPPED = 0;

    @Autowired
    private JdbcIPLoggerDao iploggerDao;

    public void init() {
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        final String ip = getClientIpAddr(request);
        // check IP blacklisted
        // return false;
        request.setAttribute(INTERCEPTED_IP, ip);
        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView model) throws Exception {
        IPLoggerLine loggerLine = new IPLoggerLine();
        loggerLine.setIp(request.getAttribute(INTERCEPTED_IP).toString());
        loggerLine.setUrl(request.getRequestURL().toString());
        loggerLine.setSource(request.getAttribute(INTERCEPTED_IP_SOURCE).toString());
        loggerLine.setStopped(REQUEST_NOT_STOPPED);
        iploggerDao.insertRecord(loggerLine);
    }

    public void setIploggerDao(JdbcIPLoggerDao iploggerDao) {
        this.iploggerDao = iploggerDao;
    }

    /**
     * This method should be single purposed, now it does 2 things.
     * Discovers IP and sets request property with 2 different attributes (IP and how it has been discovered).
     * You may create a separate object with these 2 properties (IP and discovered)
     * Perhaps change tp (if else)
     * @param request
     * @return
     */
    public String getClientIpAddr(HttpServletRequest request) {
        String ip = request.getHeader(X_FORWARDED_FOR_SOURCE);
        request.setAttribute(INTERCEPTED_IP_SOURCE, X_FORWARDED_FOR_SOURCE);
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader(PROXY_CLIENT_IP_SOURCE);
            request.setAttribute(INTERCEPTED_IP_SOURCE, PROXY_CLIENT_IP_SOURCE);
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader(WL_PROXY_CLIENT_IP_SOURCE);
            request.setAttribute(INTERCEPTED_IP_SOURCE, WL_PROXY_CLIENT_IP_SOURCE);
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader(HTTP_CLIENT_IP_SOURCE);
            request.setAttribute(INTERCEPTED_IP_SOURCE, HTTP_CLIENT_IP_SOURCE);
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader(HTTP_X_FORWARDED_FOR_SOURCE);
            request.setAttribute(INTERCEPTED_IP_SOURCE, HTTP_X_FORWARDED_FOR_SOURCE);
        }
        if (ip == null || ip.length() == 0 || UNKNOWN_SOURCE.equalsIgnoreCase(ip)) {
            request.setAttribute(INTERCEPTED_IP_SOURCE, UNKNOWN_SOURCE);
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}
