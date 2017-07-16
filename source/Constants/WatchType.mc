using Toybox.System as Sys;

const IS_ROUND = Sys.getDeviceSettings().screenShape == Sys.SCREEN_SHAPE_ROUND;

const IS_SEMI_ROUND = Sys.getDeviceSettings().screenShape == Sys.SCREEN_SHAPE_SEMI_ROUND;

const IS_SQUARE = Sys.getDeviceSettings().screenShape == Sys.SCREEN_SHAPE_RECTANGLE && !Sys.getDeviceSettings().partNumber.equals("006-B2337-00");

const IS_TALL = Sys.getDeviceSettings().screenShape == Sys.SCREEN_SHAPE_RECTANGLE && Sys.getDeviceSettings().partNumber.equals("006-B2337-00");
