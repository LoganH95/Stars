using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;


class TimeDisplay {
	var width; 
	var height;
	var seconds;  

	function initialize() { 
		seconds = false; 
    }
	
    function displayTime(dc) {
    	width = dc.getWidth();
    	height = dc.getHeight();
    	var adjust = getAdjust(); 
    	
    	drawTime(dc, Sys.getDeviceSettings().is24Hour, Sys.getClockTime(), adjust);   
    	var secondsSwitch = App.getApp().getProperty("seconds_prop");
    	if (seconds && secondsSwitch) {	
	    	displaySeconds(dc, adjust);  
	    }
	    if ( !Sys.getDeviceSettings().is24Hour && !IS_SEMI_ROUND ) {
	    	cycle(dc, adjust); 
	    }
    }
    
    hidden function getAdjust() {
    	var layout = App.getApp().getProperty("layout");
    	if ( IS_TALL ) {
    		return getAdjustTall(layout);
    	} else if ( IS_ROUND ) {
    		return getAdjustRound(layout);
    	} else if ( IS_SEMI_ROUND ) {
    		return getAdjustSemiRound(layout);
    	} else {
	    	return getAdjustSquare(layout); 
    	}
    }
    
    hidden function getAdjustTall(layout) {
	   	var ret = 0;
    	switch (layout) {
    		case heartRate_type:
    			ret = 5;
    			break;
    			
    		case line_type:
    		case heartRateCorners_type:
    			ret = 30;
    			break;
    			
    		default:
    			ret = 0;
    			break;
    	}
    	return ret;
    }
    
    hidden function getAdjustSemiRound(layout) {
    	var ret = 0;
    	switch (layout) {
    		case heartRate_type:
    			ret = 15;
    			break;
    			
    		case classic_type:
    		case classicBig_type:
    			ret = 20; 
    			break;
    			
    		case line_type:
    			ret = 40;
    			break;
    			
    		default:
    			ret = 0;
    			break;
    	}
    	return ret;
    }
    
    hidden function getAdjustRound(layout) {
    	var ret = 0;
    	switch (layout) {
    		case heartRate_type:
    		case corners_type:
    			ret = 15;
    			break;
    			
    		case classic_type:
    		case classicBig_type:
    			ret = 20; 
    			break;
    			
    		case line_type:
    			ret = 45;
    			break;
    			
    		default:
    			ret = 0;
    			break;
    	}
    	return ret;
    }
    
    hidden function getAdjustSquare(layout) {
    	var ret = 0;
    	switch (layout) {
    		case classic_type:
    		case classicBig_type:
    			ret = 15;
    			break;
    			
    		case line_type:
    			ret = 35;
    			break;
    			
    		default:
    			ret = 0;
    			break;
    	}
    	return ret;
    }
    
    hidden function drawTime(dc, mode, time, adjust) {
    	var timeString = clockTime(mode, time);
    	
    	if ( IS_TALL ) {
    		dc.drawText(width - 30, height/4 + 10 - adjust, Gfx.FONT_NUMBER_THAI_HOT, timeString, Gfx.TEXT_JUSTIFY_RIGHT);
    	} else if ( IS_ROUND ) {
    		dc.drawText(width/2, height/4 - adjust, Gfx.FONT_NUMBER_THAI_HOT, timeString, Gfx.TEXT_JUSTIFY_CENTER);
    	} else if ( IS_SEMI_ROUND ) {
    		dc.drawText(width/2, height/4 - adjust, Gfx.FONT_NUMBER_THAI_HOT, timeString, Gfx.TEXT_JUSTIFY_CENTER);
    	} else {
	    	dc.drawText(width/2, height/4 - adjust, Gfx.FONT_NUMBER_THAI_HOT, timeString, Gfx.TEXT_JUSTIFY_CENTER);
    	}
    }
    
	hidden function clockTime(mode, time) {
		var timeString; 
	    if (!mode && time.hour > 12) {
	       timeString = Lang.format("$1$:$2$", [time.hour - 12, time.min.format("%02d")]);
	    } else {
	        if (!mode && time.hour == 0) {
	        	timeString = Lang.format("$1$:$2$", [time.hour + 12, time.min.format("%02d")]);
	        } else {
	       	 	timeString = Lang.format("$1$:$2$", [time.hour, time.min.format("%02d")]);
	       	}
	    }
	    return timeString; 
	}
    
    hidden function displaySeconds(dc, adjust) {
		var secString = Lang.format("$1$", [Sys.getClockTime().sec.format("%02d")]);
		
		if ( IS_TALL ) {
    		dc.drawText(width - 15, 70 - adjust, Gfx.FONT_LARGE, secString, Gfx.TEXT_JUSTIFY_CENTER);
    	} else if ( IS_ROUND ) {
    		
    	} else if ( IS_SEMI_ROUND ) {
	    	if ((Sys.getDeviceSettings().is24Hour && Sys.getClockTime().hour >= 12) || (Sys.getClockTime().hour >= 10 && Sys.getClockTime().hour <= 12) || (Sys.getClockTime().hour >= 22 && Sys.getClockTime().hour <= 23) || Sys.getClockTime().hour == 0) {
	    		dc.drawText(width/2 - 1, height/2 + 5 - adjust, Gfx.FONT_NUMBER_MILD, secString, Gfx.TEXT_JUSTIFY_CENTER);
	        } else {
	    		dc.drawText(width - 23, height/2 - 10 - adjust, Gfx.FONT_LARGE, secString, Gfx.TEXT_JUSTIFY_CENTER);
	    	}
    	} else {
	    	if ((Sys.getDeviceSettings().is24Hour && Sys.getClockTime().hour >= 12) || (Sys.getClockTime().hour >= 10 && Sys.getClockTime().hour <= 12) || (Sys.getClockTime().hour >= 22 && Sys.getClockTime().hour <= 23) || Sys.getClockTime().hour == 0) {
    			dc.drawText(width - 20, 40 - adjust, Gfx.FONT_LARGE, secString, Gfx.TEXT_JUSTIFY_CENTER);
	        } else {
	    		dc.drawText(width - 35, 40 - adjust, Gfx.FONT_LARGE, secString, Gfx.TEXT_JUSTIFY_CENTER);
	    	}
    	}
	}
	
	function cycle(dc, adjust) {
		var cycle; 
		if (Sys.getClockTime().hour < 12) {
			cycle = "AM";
		} else {
			cycle = "PM"; 
		}
		
		if ( IS_TALL ) {
    		dc.drawText(width - 14, 103 - adjust, Gfx.FONT_SMALL, cycle, Gfx.TEXT_JUSTIFY_CENTER);
    	} else if ( IS_ROUND ) {
    		if ((Sys.getClockTime().hour >= 10 && Sys.getClockTime().hour <= 12) || (Sys.getClockTime().hour >= 22 && Sys.getClockTime().hour <= 23) || Sys.getClockTime().hour == 0) {
				dc.drawText(width - 25, height/2 + 20 - adjust, Gfx.FONT_SMALL, cycle, Gfx.TEXT_JUSTIFY_CENTER);
	    	} else {
	    		dc.drawText(width - 35, height/2 + 20 - adjust, Gfx.FONT_SMALL, cycle, Gfx.TEXT_JUSTIFY_CENTER);
	    	}
    	} else {
			adjust += 40 - height/4;
	    	if ((Sys.getClockTime().hour >= 10 && Sys.getClockTime().hour <= 12) || (Sys.getClockTime().hour >= 22 && Sys.getClockTime().hour <= 23) || Sys.getClockTime().hour == 0) {
				dc.drawText(width - 20, 87 - adjust, Gfx.FONT_SMALL, cycle, Gfx.TEXT_JUSTIFY_CENTER);
	    	} else {
	    		dc.drawText(width - 35, 87 - adjust, Gfx.FONT_SMALL, cycle, Gfx.TEXT_JUSTIFY_CENTER);
	    	}
    	}
	}
}