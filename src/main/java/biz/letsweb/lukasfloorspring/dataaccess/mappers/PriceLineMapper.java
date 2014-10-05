package biz.letsweb.lukasfloorspring.dataaccess.mappers;

import biz.letsweb.lukasfloorspring.dataaccess.model.PriceLine;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 * 
 * @author Tomasz
 */
public class PriceLineMapper implements RowMapper<PriceLine> {

  @Override
  public PriceLine mapRow(ResultSet rs, int i) throws SQLException {
    PriceLine user = new PriceLine();
    user.setId(rs.getInt("id"));
    user.setService(rs.getString("service"));
    user.setUnit(rs.getString("unit"));
    user.setPriceMin(rs.getDouble("priceMin"));
    user.setPriceMax(rs.getDouble("priceMax"));
    user.setInserted(rs.getTimestamp("inserted"));
    return user;
  }
}
