/**
 * Created by plter on 3/24/16.
 */
package com.plter.hittest {
import com.plter.two.anim.PropertyAnim;
import com.plter.two.app.Context;
import com.plter.two.display.Label;
import com.plter.two.display.Loader;
import com.plter.two.display.Scene;

public class MainScene extends Scene {

    private var _loader:Loader;
    private var _label:Label;
    private var _result:Label;

    public function MainScene(context:Context) {
        super(context);

        _loader = new Loader(context);
        _loader.load("image.jpg");
        addChild(_loader);
        _loader.onLoad.add(function (e:*, target:Loader):void {
            target.x = context.stage.left + target.geometryWidth / 2;
            target.y = context.stage.top - target.geometryHeight / 2;
        });

        _label = new Label(context, "Two.as", 48);
        _label.y = 0.5;
        _label.transparent = true;
        addChild(_label);

        _result = new Label(context, "HitTest:false", 32, "#ff0000");
        _result.y = -0.5;
        addChild(_result);

        new PropertyAnim(this, _label, "x", -1, 1, 480, function (e:*, anim:PropertyAnim):void {
            anim.reverse().start();
        }).start();

        onUpdate.add(function (e:*, target:*):void {
            _result.text = "HitTest:" + _label.hitTestObject(_loader);
        });
    }
}
}
