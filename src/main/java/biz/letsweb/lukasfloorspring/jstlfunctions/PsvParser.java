package biz.letsweb.lukasfloorspring.jstlfunctions;

import java.util.List;
import org.apache.tiles.Attribute;

/**
 * PipeSeparatedValues psv. This is assisting in parsing from line such as Podłogi i
 * stolarka.|/|home|Podłogi i stolarka from Tiles list.
 */
public final class PsvParser {

  private PsvParser() {}

  public static String psvParser(List<Attribute> menuList, String menuLineIdx, String psvName) {
    int psvIndex = Integer.parseInt(menuLineIdx);
    String s;
    final String[] values = ((String) menuList.get(psvIndex).getValue()).split("\\|");
    s = values[Names.getIndexForName(psvName)];
    return s;
  }

  enum Names {

    MENU_DISPLAY(0), URL(1), ID(2), BREADCRUMB_DISPLAY(3), ;

    private Names(int ind) {
      this.index = ind;
    }

    public int index;

    public static int getIndexForName(String name) {
      return Names.valueOf(name).index;
    }
  }
}
