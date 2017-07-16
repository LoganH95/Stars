using Toybox.System as Sys;
using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class Symbol {
	hidden var bluetooth, notifications;
	
	function initialize() {
		bluetooth = Ui.loadResource(Rez.Drawables.bluetooth_ID);
        notifications = Ui.loadResource(Rez.Drawables.notifications_ID);
	}
	
	function drawBluetooth(dc, x, y) {
		if (Sys.getDeviceSettings().phoneConnected) {
			dc.drawBitmap(x, y, bluetooth);
		} 
	}
	
	function drawNotification(dc, x, y) {
		if (Sys.getDeviceSettings().notificationCount >= 1) {
			dc.drawBitmap(x, y, notifications);
		} 
	}
}