/**
 * Created by plter on 3/17/16.
 */
package com.plter.flashspritesheet {
import com.plter.two.app.Context;
import com.plter.two.display.Scene;
import com.plter.two.flash.SpriteSheet;

public class FlashSpriteSheetScene extends Scene {

    public function FlashSpriteSheetScene(context:Context) {
        super(context);

        var ss:SpriteSheet = new SpriteSheet(context, "Anim.json", "Anim.png", 50);
        ss.load();
        ss.onLoad.add(function (event:*, target:*):void {
            ss.play();
        });

        addChild(ss);
    }
}
}
