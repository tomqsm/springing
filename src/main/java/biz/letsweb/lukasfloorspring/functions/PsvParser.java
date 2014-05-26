package biz.letsweb.lukasfloorspring.functions;

import java.util.List;
import org.apache.tiles.Attribute;

public final class PsvParser {
    private PsvParser(){}
    public static String psvParser(List<Attribute> menuList, String menuLineIdx, String psvName){
        int psvIndex = Integer.parseInt(menuLineIdx);
        String s;
        final String[] values = ((String)menuList.get(psvIndex).getValue()).split("\\|");
        s = values[Names.resolveByName(psvName)];
        return s;
    }
    enum Names{
        URL(1), MENU_DISPLAY(0), BREADCRUMB_DISPLAY(3), ID(2);

        private Names(int ind) {
            this.index = ind;
        }
        public int index;
        public static int resolveByName(String name){
            return Names.valueOf(name).index;
        }
    }
}
