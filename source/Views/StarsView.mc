using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class StarsView extends Ui.WatchFace {
	var time  = new TimeDisplay();
	var layout = new Layout(); 
	var star; 

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc) {
        star = Ui.loadResource(Rez.Drawables.stars_ID);
    }

    function onShow() {
    }

    function onUpdate(dc) {
    	resetScreen(dc);
    	time.displayTime(dc);
    	layout.displayInfo(dc);
    }
    
    function resetScreen(dc) {
    	dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
		dc.clear();
		dc.setColor(Color.getPrimaryColor(), Gfx.COLOR_TRANSPARENT);
		dc.drawBitmap(0, 0, star);
    }

    function onHide() {
    }

    function onExitSleep() {
    	time.seconds = true;  
    }

    function onEnterSleep() {
    	if(time != null) {
    		time.seconds = false; 
    	}
    }

}
