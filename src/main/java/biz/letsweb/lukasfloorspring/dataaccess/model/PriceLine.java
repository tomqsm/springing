package biz.letsweb.lukasfloorspring.dataaccess.model;

import java.sql.Timestamp;

/**
 * 
 * @author Tomasz
 */
public class PriceLine {

  private int id;
  private String service;
  private String unit;
  private Double price;
  private Timestamp inserted;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getService() {
    return service;
  }

  public void setService(String service) {
    this.service = service;
  }

  public String getUnit() {
    return unit;
  }

  public void setUnit(String unit) {
    this.unit = unit;
  }

  public Double getPrice() {
    return price;
  }

  public void setPrice(Double price) {
    this.price = price;
  }

  public Timestamp getInserted() {
    return inserted;
  }

  public void setInserted(Timestamp inserted) {
    this.inserted = inserted;
  }

}
