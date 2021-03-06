package biz.letsweb.lukasfloorspring.dataaccess.model;

import java.sql.Timestamp;

/**
 * 
 * @author Tomasz
 */
public class IPLoggerLine {

  private int id;
  private String ip;
  private String url;
  private String source;
  private int stopped;
  private Timestamp inserted;

  public IPLoggerLine(String ip, String url) {
    this.ip = ip;
    this.url = url;
  }

  public IPLoggerLine() {}

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public Timestamp getInserted() {
    return inserted;
  }

  public void setInserted(Timestamp inserted) {
    this.inserted = inserted;
  }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public int getStopped() {
        return stopped;
    }

    public void setStopped(int stopped) {
        this.stopped = stopped;
    }

}
