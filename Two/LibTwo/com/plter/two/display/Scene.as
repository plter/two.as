/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.display {
import com.plter.two.app.Context;
import com.plter.two.events.EventListenerList;

public class Scene extends Container {
    
    private var _onUpdate:EventListenerList = new EventListenerList();
    
    public function Scene(context:Context) {
        super(context);
    }

    public function update(dt:uint):void {
    }

    public function onUiEvent(type:String, x:Number, y:Number, e:MouseEvent):void {
    }

    public function get onUpdate():EventListenerList {
        return _onUpdate;
    }
}
}
