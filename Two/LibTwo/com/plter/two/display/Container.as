/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.display {
import com.plter.two.app.Context;
import com.plter.two.supports.threejs.THREE;

public class Container extends Display {

    private var _children:Array = [];

    public function Container(context:Context) {
        super(context, new THREE.Object3D());
    }

    public function addChild(display:Display):void {
        threeJsObject['add'](display.threeJsObject);
    }

    public function removeChild(display:Display):void {
        threeJsObject['remove'](display.threeJsObject);
    }


    public function get children():Array {
        while (_children.length) {
            _children.pop();
        }

        var children3D:* = threeJsObject['children'];
        var length:int = children3D['length'];
        for (var i:int = 0; i < length; i++) {
            _children.push(children3D[i]['displayObject']);
        }

        return _children;
    }
}
}
