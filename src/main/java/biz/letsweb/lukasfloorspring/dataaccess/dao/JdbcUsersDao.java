package biz.letsweb.lukasfloorspring.dataaccess.dao;

import biz.letsweb.lukasfloorspring.dataaccess.model.User;
import biz.letsweb.lukasfloorspring.dataaccess.mappers.UserMapper;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

/**
 * 
 * @author Tomasz
 */
@Service("usersDao")
public class JdbcUsersDao {

  private NamedParameterJdbcTemplate jdbcTemplate;

  public void setDataSource(DataSource dataSource) {
    this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
  }

  public User findUserById(int id){
        String sql = "select * from lksflr.users where id=:id";
        Map<String,Object> params = new HashMap<>();
        params.put("id", id);
        return jdbcTemplate.queryForObject(sql, params, new UserMapper());
    }

  public List<User> findAll() {
    String sql = "select * from LKSFLR.users";
    return jdbcTemplate.query(sql, new UserMapper());
  }

  public void deleteById(int id){
      String sql = "delete from lksflr.users where id=:id";
      Map<String,Object> params = new HashMap<>();
      params.put("id", id);
      jdbcTemplate.update(sql, params);
  }
}
