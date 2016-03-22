/**
 * Created by plter on 3/22/16.
 */
package com.plter.usingdisplay {
import com.plter.two.app.Context;
import com.plter.two.display.ImageView;
import com.plter.two.display.Scene;

public class MainScene extends Scene {

    private var img:ImageView;

    public function MainScene(context:Context) {
        super(context);

        img = new ImageView(context);
        addChild(img);
        img.load("Image.png");
    }
}
}
