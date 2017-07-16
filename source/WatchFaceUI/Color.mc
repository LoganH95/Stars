using Toybox.Graphics as Gfx;
using Toybox.Application as App;

class Color {
    static function getPrimaryColor() {
    	var primaryColor = App.getApp().getProperty("color_primary");
    	if (primaryColor == null) {
			primaryColor = 0xFFFFFF; 
		}
    	return primaryColor; 
    }
}