package biz.letsweb.lukasfloorspring.dataaccess.mappers;

import biz.letsweb.lukasfloorspring.dataaccess.model.IPLoggerLine;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class IPLoggerLineMapper implements RowMapper<IPLoggerLine> {

  @Override
  public IPLoggerLine mapRow(ResultSet rs, int i) throws SQLException {
    IPLoggerLine line = new IPLoggerLine();
    line.setId(rs.getInt("id"));
    line.setIp(rs.getString("ip"));
    line.setUrl(rs.getString("url"));
    line.setSource(rs.getString("source"));
    line.setStopped(rs.getInt("stopped"));
    line.setInserted(rs.getTimestamp("inserted"));
    return line;
  }
}
