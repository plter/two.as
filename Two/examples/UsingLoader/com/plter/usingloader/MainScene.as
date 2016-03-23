/**
 * Created by plter on 3/22/16.
 */
package com.plter.usingloader {
import com.plter.two.app.Context;
import com.plter.two.display.Loader;
import com.plter.two.display.Scene;

public class MainScene extends Scene {

    private var img:Loader;

    public function MainScene(context:Context) {
        super(context);

        img = new Loader(context);
        addChild(img);
        img.load("Image.jpg");
        
        img.z = -1;
    }
}
}
