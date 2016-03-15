/**
 * Created by plter on 3/15/16.
 */
package com.plter.usetext {
import com.plter.two.app.Context;
import com.plter.two.display.Scene;
import com.plter.two.display.TextLine;

public class MainScene extends Scene {


    private var text:TextLine;

    public function MainScene(context:Context) {
        super(context);

        text = new TextLine(context, "Hello World", 30);
        addChild(text);
    }
}
}
