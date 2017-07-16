using Toybox.Graphics as Gfx;
using Toybox.Application as App;

enum { 
		classic_type,
		classicBig_type,
		minimal_type,
		minimalIcons_type,
		corners_type,
		minimalExpanded_type,
		minimalBattery_type,
		expanded_type,
		line_type,
		heartRate_type,
		heartRateCorners_type
	}

class Layout {
	hidden var width, height;
	hidden var symbol = new Symbol(); 
	
	function initialize() {
    }
    
    function displayInfo(dc) {
    	width = dc.getWidth();
    	height = dc.getHeight();
    	var layout = App.getApp().getProperty("layout");
    	dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
    	
    	switch (layout) {
    		case classic_type:
    			classic(dc);
    			break;
    		
			case classicBig_type:
				classicBig(dc);
				break;
				
			case minimal_type:
				minimal(dc);
				break;
		
			case minimalIcons_type:
				minimalIcons(dc);
				break;
			
			case corners_type:
				corners(dc);
				break;
			
			case minimalExpanded_type:
				minimalExpanded(dc);
				break;
			
			case minimalBattery_type:
				minimalBattery(dc);
				break; 
				
			case expanded_type:
				expanded(dc);
				break;
				
			case line_type:
				line(dc);
				break;
				
			case heartRate_type:
				heartRate(dc);
				break;
				
			case heartRateCorners_type:
				heartRateCorners(dc);
				break;
    	}
    }
    
    function classic(dc) {	
		drawTable(dc);
    
    	if ( IS_TALL ) {
    		StatsDisplay.drawDate(dc, width/2, 3*height/4 - 16, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER);
			StatsDisplay.drawBattery(dc, width/2 - 8, 3*height/4 + 12, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawSteps(dc, width/2, 3*height/4 + 12, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_LEFT);
			symbol.drawBluetooth(dc, 3*width/4 + 7, 3*height/4 - 10);
			symbol.drawNotification(dc, 3*width/4 + 17, 3*height/4 - 12);
    	} else if ( IS_ROUND ) {
    		StatsDisplay.drawDate(dc, width/2, 3*height/4 - 16, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER);
			StatsDisplay.drawBattery(dc, width/2 - 15, 3*height/4 + 12, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawSteps(dc, width/2 - 2, 3*height/4 + 12, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_LEFT);
			symbol.drawBluetooth(dc, 3*width/4 + 1, 3*height/4 - 10);
			symbol.drawNotification(dc, 3*width/4 + 12, 3*height/4 - 12);
    	} else if ( IS_SEMI_ROUND ) {
    		StatsDisplay.drawDate(dc, width/2, 3*height/4 - 16, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER);
			StatsDisplay.drawBattery(dc, width/2 - 15, 3*height/4 + 12, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawSteps(dc, width/2 - 2, 3*height/4 + 12, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_LEFT);
			symbol.drawBluetooth(dc, 3*width/4 + 1, 3*height/4 - 10);
			symbol.drawNotification(dc, 3*width/4 + 12, 3*height/4 - 12);
    	} else {
	    	StatsDisplay.drawDate(dc, width/2, 3*height/4 - 16, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER);
			StatsDisplay.drawBattery(dc, width/2 - 15, 3*height/4 + 12, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawSteps(dc, width/2 - 2, 3*height/4 + 12, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_LEFT);
			symbol.drawBluetooth(dc, 3*width/4 + 1, 3*height/4 - 10);
			symbol.drawNotification(dc, 3*width/4 + 12, 3*height/4 - 12);
    	}
    }
    
    hidden function classicBig(dc) {
		drawTableBig(dc);
		
    	if ( IS_TALL ) {
    		StatsDisplay.drawDate(dc, width/2 - 5, 3*height/4 - 16, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER); 
			StatsDisplay.drawBattery(dc, width/2 - 5, 3*height/4 + 12, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawSteps(dc, width/2 + 5, 3*height/4 + 12, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_LEFT);
			symbol.drawBluetooth(dc, 3*width/4 - 2, 3*height/4 - 8);
			symbol.drawNotification(dc, 3*width/4 + 9, 3*height/4 - 10);
    	} else if ( IS_ROUND ) {
	    	StatsDisplay.drawDate(dc, width/2, 3*height/4 - 16, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER); 
			StatsDisplay.drawBattery(dc, width/2 - 5, 3*height/4 + 12, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawSteps(dc, width/2, 3*height/4 + 12, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_LEFT);
			symbol.drawBluetooth(dc, 3*width/4 + 1, 3*height/4 - 10);
			symbol.drawNotification(dc, 3*width/4 + 12, 3*height/4 - 12);
    	} else if ( IS_SEMI_ROUND ) {
    		StatsDisplay.drawDate(dc, width/2, 3*height/4 - 16, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER); 
			StatsDisplay.drawBattery(dc, width/2 - 5, 3*height/4 + 12, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawSteps(dc, width/2 + 5, 3*height/4 + 12, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_LEFT);
			symbol.drawBluetooth(dc, 3*width/4 + 1, 3*height/4 - 10);
			symbol.drawNotification(dc, 3*width/4 + 12, 3*height/4 - 12);
    	} else {
	    	StatsDisplay.drawDate(dc, width/2, 3*height/4 - 16, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER); 
			StatsDisplay.drawBattery(dc, width/2 - 5, 3*height/4 + 12, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawSteps(dc, width/2 + 5, 3*height/4 + 12, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_LEFT);
			symbol.drawBluetooth(dc, 3*width/4 + 1, 3*height/4 - 10);
			symbol.drawNotification(dc, 3*width/4 + 12, 3*height/4 - 12);
    	}
    }
    
    hidden function minimal(dc) {
		if ( IS_ROUND ) {
			StatsDisplay.drawDate(dc, width/2, 20, Gfx.FONT_LARGE, Gfx.TEXT_JUSTIFY_CENTER);
    	} else if ( IS_SEMI_ROUND ) {
			StatsDisplay.drawDate(dc, width/2, 15, Gfx.FONT_LARGE, Gfx.TEXT_JUSTIFY_CENTER);
    	} else {
			StatsDisplay.drawDate(dc, width/2, -3, Gfx.FONT_LARGE, Gfx.TEXT_JUSTIFY_CENTER);
    	}
    }
    
    hidden function minimalIcons(dc) {
    	minimal(dc); 
    	if ( IS_ROUND ) {
			symbol.drawBluetooth(dc, width/2 - 11, 7);
			symbol.drawNotification(dc, width/2, 5);
    	} else { 
    		cornerIcons(dc);
    	}
    }
    
    hidden function minimalExpanded(dc) {
		minimalBattery(dc); 
		if ( IS_ROUND ) {
			symbol.drawBluetooth(dc, width/2 - 34, 7);
			symbol.drawNotification(dc, width/2 + 28, 5);
		} else {
			cornerIcons(dc); 
		}
	}
	
	hidden function minimalBattery(dc) {
		minimal(dc); 
		if ( IS_TALL ) {
			StatsDisplay.drawBattery(dc, width, -3, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_RIGHT); 
    	} else if ( IS_ROUND ) {
			StatsDisplay.drawBattery(dc, width/2 + 5, 0, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER); 
    	} else if ( IS_SEMI_ROUND ) {	
			StatsDisplay.drawBattery(dc, width/2, -4, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER); 
    	} else {
			StatsDisplay.drawBattery(dc, 205, -3, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT); 
    	}
	}
    
    hidden function corners(dc) {
    	cornerIcons(dc);
    	if ( IS_TALL ) {
			StatsDisplay.drawDate(dc, width, height - 24, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT); 
			StatsDisplay.drawBattery(dc, width, -3, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT); 
			StatsDisplay.drawSteps(dc, 0, height - 24, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_LEFT); 
    	} else if ( IS_ROUND ) {
			StatsDisplay.drawDate(dc, 192, 155, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT); 
			StatsDisplay.drawBattery(dc, 190, 25, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT); 
			StatsDisplay.drawSteps(dc, 23, 155, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_LEFT);
    	} else if ( IS_SEMI_ROUND ) {
    		StatsDisplay.drawDate(dc, 192, 135, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT); 
			StatsDisplay.drawBattery(dc, 192, 17, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT); 
			StatsDisplay.drawSteps(dc, 20, 135, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_LEFT); 
    	} else {
			StatsDisplay.drawDate(dc, 203, 125, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT); 
			StatsDisplay.drawBattery(dc, 203, -3, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_RIGHT); 
			StatsDisplay.drawSteps(dc, 0, 125, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_LEFT); 
    	} 
    }
    
    hidden function cornerIcons(dc) {
    	if ( IS_TALL ) {
    		symbol.drawBluetooth(dc, -2, 0);
       		symbol.drawNotification(dc, 9, -2);
    	} else if ( IS_ROUND ) {
			symbol.drawBluetooth(dc, 28, 32);
			symbol.drawNotification(dc, 39, 30);
    	} else if ( IS_SEMI_ROUND ) {
    		symbol.drawBluetooth(dc, 20, 20);
    		symbol.drawNotification(dc, 31, 18);
    	} else {
    		symbol.drawBluetooth(dc, -2, 0);
       		symbol.drawNotification(dc, 9, -2);
    	}
	}
	
	hidden function circularIcons(dc) {
		symbol.drawBluetooth(dc, width/2 - 11, 7);
		symbol.drawNotification(dc, width/2, 5);
    	minimal(dc); 
    }
	
	hidden function expanded(dc) {
		minimalExpanded(dc);
		if ( IS_SEMI_ROUND || IS_ROUND ) {	
	    	StatsDisplay.drawSteps(dc, width/2, height - 30, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER);
    	} else {
	    	StatsDisplay.drawSteps(dc, width/2, height - 25, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER);
    	}
	}
	
	hidden function line(dc) {
		if ( IS_TALL ) {
    		dc.drawLine(width/2 - 10, height/2 + 22, width/2 - 10, height/2 + 70);
		    StatsDisplay.drawDate(dc, width/2, height/2 - 7, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER); 
			StatsDisplay.drawBattery(dc, width/2 - 17, height/2 + 19, Gfx.FONT_XTINY, Gfx.TEXT_JUSTIFY_RIGHT); 
			StatsDisplay.drawSteps(dc, width/2 - 17, height/2 + 36, Gfx.FONT_XTINY, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawDistance(dc, width/2 - 17, height/2 + 53, Gfx.FONT_XTINY, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawCalories(dc, width/2 - 3, height/2 + 19, Gfx.FONT_XTINY, Gfx.TEXT_JUSTIFY_LEFT);
			StatsDisplay.drawMessages(dc, width/2 - 3, height/2 + 36, Gfx.FONT_XTINY, Gfx.TEXT_JUSTIFY_LEFT);
			StatsDisplay.drawConnected(dc, width/2 - 3, height/2 + 53, Gfx.FONT_XTINY, Gfx.TEXT_JUSTIFY_LEFT);
    	} else if ( IS_ROUND ) {
    		dc.drawLine(width/2, height/2 + 27, width/2, height/2 + 75);
	    	StatsDisplay.drawDate(dc, width/2, height/2 - 2, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER); 
			StatsDisplay.drawBattery(dc, width/2 - 7, height/2 + 24, Gfx.FONT_XTINY, Gfx.TEXT_JUSTIFY_RIGHT); 
			StatsDisplay.drawStepsGoal(dc, width/2 - 7, height/2 + 41, Gfx.FONT_XTINY, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawDistance(dc, width/2 - 7, height/2 + 58, Gfx.FONT_XTINY, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawCalories(dc, width/2 + 7, height/2 + 24, Gfx.FONT_XTINY, Gfx.TEXT_JUSTIFY_LEFT);
			StatsDisplay.drawMessages(dc, width/2 + 7, height/2 + 41, Gfx.FONT_XTINY, Gfx.TEXT_JUSTIFY_LEFT);
			StatsDisplay.drawConnected(dc, width/2 + 7, height/2 + 58, Gfx.FONT_XTINY, Gfx.TEXT_JUSTIFY_LEFT);
    	} else if ( IS_SEMI_ROUND ) {		
    		dc.drawLine(width/2 - 5, height/2 + 29, width/2 - 5, height/2 + 77);
			StatsDisplay.drawDate(dc, width/2, height/2 + 4, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER); 
			StatsDisplay.drawBattery(dc, width/2 - 12, height/2 + 26, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_RIGHT); 
			StatsDisplay.drawStepsGoal(dc, width/2 - 12, height/2 + 43, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawDistance(dc, width/2 - 12, height/2 + 60, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawCalories(dc, width/2 + 2, height/2 + 26, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_LEFT);
			StatsDisplay.drawMessages(dc, width/2 + 2, height/2 + 43, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_LEFT);
			StatsDisplay.drawConnected(dc, width/2 - 1, height/2 + 60, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_LEFT);
    	} else {
			dc.drawLine(width/2, height/2 + 22, width/2, height/2 + 70);
		    StatsDisplay.drawDate(dc, width/2, height/2 - 7, Gfx.FONT_MEDIUM, Gfx.TEXT_JUSTIFY_CENTER); 
			StatsDisplay.drawBattery(dc, width/2 - 7, height/2 + 19, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_RIGHT); 
			StatsDisplay.drawStepsGoal(dc, width/2 - 7, height/2 + 36, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawDistance(dc, width/2 - 7, height/2 + 53, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_RIGHT);
			StatsDisplay.drawCalories(dc, width/2 + 7, height/2 + 19, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_LEFT);
			StatsDisplay.drawMessages(dc, width/2 + 7, height/2 + 36, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_LEFT);
			StatsDisplay.drawConnected(dc, width/2 + 7, height/2 + 53, Gfx.FONT_SMALL, Gfx.TEXT_JUSTIFY_LEFT);
    	}
	}
	
	hidden function heartRate(dc) {
		minimal(dc);
		if ( IS_TALL ) {
			StatsDisplay.drawHeartRate(dc, width/2, 3*height/4 - 32, Gfx.FONT_NUMBER_THAI_HOT, Gfx.TEXT_JUSTIFY_CENTER);
    	} else if ( IS_ROUND ) {
			StatsDisplay.drawHeartRate(dc, width/2, 3 * height/4 - 24, Gfx.FONT_NUMBER_HOT, Gfx.TEXT_JUSTIFY_CENTER);
    	} else if ( IS_SEMI_ROUND ) {		
			StatsDisplay.drawHeartRate(dc, width/2, 3 * height/4 - 12, Gfx.FONT_NUMBER_HOT, Gfx.TEXT_JUSTIFY_CENTER);
    	} else {
    	}
	}
	
	hidden function heartRateCorners(dc) {
		corners(dc);
		if ( IS_TALL ) {
			StatsDisplay.drawHeartRate(dc, width/2, 3*height/4 - 32, Gfx.FONT_NUMBER_THAI_HOT, Gfx.TEXT_JUSTIFY_CENTER);
    	} else if ( IS_ROUND ) {
			StatsDisplay.drawHeartRate(dc, width/2, 0, Gfx.FONT_NUMBER_HOT, Gfx.TEXT_JUSTIFY_CENTER);
    	} else if ( IS_SEMI_ROUND ) {		
			StatsDisplay.drawHeartRate(dc, width/2, 0, Gfx.FONT_NUMBER_HOT, Gfx.TEXT_JUSTIFY_CENTER);
    	} else {
    	
    	}
		
	}
	
	hidden function drawTable(dc) {
		if ( IS_TALL ) {
    		dc.drawLine(width/4 - 3, 3*height/4 + 12, 3*width/4, 3*height/4 + 12);
			dc.drawLine(width/2 - 5, 3*height/4 + 12, width/2 - 5, 3*height/4 + 30);
    	} else if ( IS_SEMI_ROUND ||  IS_ROUND ) {	
    		dc.drawLine(width/4, 3*height/4 + 12, 3*width/4, 3*height/4 + 12);
			dc.drawLine(width/2 - 10, 3*height/4 + 12, width/2 - 10, 3*height/4 + 30);	
    	} else {
    		dc.drawLine(width/4, 3*height/4 + 12, 3*width/4, 3*height/4 + 12);
			dc.drawLine(width/2 - 10, 3*height/4 + 12, width/2 - 10, 3*height/4 + 30);
    	}
    }
    
    hidden function drawTableBig(dc) {
    	if ( IS_TALL ) {
    		dc.drawLine(width/4 - 10, 3*height/4 + 12, 3*width/4, 3*height/4 + 12);
			dc.drawLine(width/2, 3*height/4 + 12, width/2, 3*height/4 + 36);
    	} else if ( IS_ROUND ) {
    		dc.drawLine(width/4, 3*height/4 + 12, 3*width/4, 3*height/4 + 12);
			dc.drawLine(width/2 - 2, 3*height/4 + 12, width/2 - 2, height - 17);
    	} else if ( IS_SEMI_ROUND ) {		
    		dc.drawLine(width/4, 3*height/4 + 12, 3*width/4, 3*height/4 + 12);
			dc.drawLine(width/2, 3*height/4 + 12, width/2, height - 12);
    	} else {
    		dc.drawLine(width/4, 3*height/4 + 12, 3*width/4, 3*height/4 + 12);
			dc.drawLine(width/2, 3*height/4 + 12, width/2, height);
    	}
    }
}