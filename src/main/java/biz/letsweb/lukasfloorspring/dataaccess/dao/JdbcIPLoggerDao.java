package biz.letsweb.lukasfloorspring.dataaccess.dao;

import biz.letsweb.lukasfloorspring.dataaccess.model.IPLoggerLine;
import java.util.HashMap;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

@Service("iploggerDao")
public class JdbcIPLoggerDao {

  private NamedParameterJdbcTemplate jdbcTemplate;

  public void setDataSource(DataSource dataSource) {
    this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
  }

  public void insertRecord(IPLoggerLine loggerLine) {
        String sql = "insert into LKSFLR.IPLOGS values (DEFAULT, :ip, :url, DEFAULT)";
        Map<String, Object> params = new HashMap<>();
        params.put("ip", loggerLine.getId());
        params.put("url", loggerLine.getUrl());
        jdbcTemplate.update(sql, params);
    }
}
