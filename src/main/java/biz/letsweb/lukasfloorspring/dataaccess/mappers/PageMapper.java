package biz.letsweb.lukasfloorspring.dataaccess.mappers;

import biz.letsweb.lukasfloorspring.dataaccess.model.Page;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 * 
 * @author Tomasz
 */
public class PageMapper implements RowMapper<Page> {

  @Override
  public Page mapRow(ResultSet rs, int i) throws SQLException {
    Page page = new Page();
    page.setId(rs.getInt("id"));
    page.setTitle(rs.getString("title"));
    page.setMenu(rs.getString("menu"));
    page.setContent(rs.getString("content"));
    page.setLanguage(rs.getString("language"));
    return page;
  }
}
