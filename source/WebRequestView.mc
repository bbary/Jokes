//
// Copyright 2015-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

//! Shows the web request result
class WebRequestView extends WatchUi.View {
    private var question as String;
    private var response as String;
    var received = false;
    //! Constructor
    public function initialize() {
        WatchUi.View.initialize();
    }

    //! Load your resources here
    //! @param dc Device context
    public function onLayout(dc as Dc) as Void {
    }

    //! Restore the state of the app and prepare the view to be shown
    public function onShow() as Void {
    }

    //! Update the view
    //! @param dc Device Context
    public function onUpdate(dc as Dc) as Void {
        if(received){
            /*
            dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_BLACK);
            dc.clear();
            dc.drawText(dc.getWidth() / 2, dc.getHeight() / 4, Graphics.FONT_TINY, question, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
            dc.drawText(dc.getWidth() / 2, dc.getHeight()*3/4, Graphics.FONT_TINY, response, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
            */
            dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
            dc.clear();
            var posY = 0;
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
            posY = writer.writeLines(dc, question, Graphics.FONT_TINY, posY);
            posY = writer.writeLines(dc, "\n", Graphics.FONT_TINY, posY);
            dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
            posY = writer.writeLines(dc, response, Graphics.FONT_TINY, posY);
            writer.testFit(posY);
        }

    }

    //! Called when this View is removed from the screen. Save the
    //! state of your app here.
    public function onHide() as Void {
    }

    //! Show the result or status of the web request
    //! @param args Data from the web request, or error message
    public function onReceive(args as Dictionary) as Void {
        System.println(args);
        question = args.get("setup");
        response = args.get("punchline");
        received=true;
        //var keys = args.keys();
        //var joke = Lang.format("$1$: $2$\n", args[keys[1]], args[keys[2]]);
        WatchUi.requestUpdate();
    }
}
