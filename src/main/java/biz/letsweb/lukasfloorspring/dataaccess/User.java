package biz.letsweb.lukasfloorspring.dataaccess;

import java.sql.Timestamp;

/**
 * 
 * @author Tomasz
 */
public class User {

  private int id;
  private String fname;
  private String lname;
  private Timestamp inserted;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getFname() {
    return fname;
  }

  public void setFname(String fname) {
    this.fname = fname;
  }

  public String getLname() {
    return lname;
  }

  public void setLname(String lname) {
    this.lname = lname;
  }

  public Timestamp getInserted() {
    return inserted;
  }

  public void setInserted(Timestamp inserted) {
    this.inserted = inserted;
  }


  @Override
  public String toString() {
    return "User{" + "id=" + id + ", fname=" + fname + ", lname=" + lname + ", inserted="
        + inserted + '}';
  }


}
