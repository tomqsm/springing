package biz.letsweb.lukasfloorspring.dataaccess;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 * 
 * @author Tomasz
 */
public class UserMapper implements RowMapper<User> {

  @Override
  public User mapRow(ResultSet rs, int i) throws SQLException {
    User user = new User();
    user.setId(rs.getInt("id"));
    user.setFname(rs.getString("fname"));
    user.setLname(rs.getString("lname"));
    user.setInserted(rs.getTimestamp("inserted"));
    return user;
  }
}
