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
  private Double priceMin;
  private Double priceMax;
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

  public Double getPriceMin() {
    return priceMin;
  }

  public void setPriceMin(Double priceMin) {
    this.priceMin = priceMin;
  }

  public Double getPriceMax() {
    return priceMax;
  }

  public void setPriceMax(Double priceMax) {
    this.priceMax = priceMax;
  }

  public Timestamp getInserted() {
    return inserted;
  }

  public void setInserted(Timestamp inserted) {
    this.inserted = inserted;
  }

}
