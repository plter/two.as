/**
 * Created by plter on 3/15/16.
 */
package com.plter.usinglabel {
import com.plter.two.app.Context;
import com.plter.two.display.Scene;
import com.plter.two.display.Label;

public class MainScene extends Scene {


    private var tl:Label;

    public function MainScene(context:Context) {
        super(context);

        tl = new Label(context, "Hello World", 32);
        addChild(tl);
    }
}
}
