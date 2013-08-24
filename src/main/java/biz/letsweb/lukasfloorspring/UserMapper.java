package biz.letsweb.lukasfloorspring;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Tomasz
 */
public class UserMapper implements RowMapper<User> {

    public User mapRow(ResultSet rs, int i) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setFname(rs.getString("fname"));
        return user;
    }
}
