/**
 * Created by plter on 3/17/16.
 */
package com.plter.two.events {
public class EventListenerList {


    private var _els:Array = [];

    public function EventListenerList() {

    }

    public function add(listener:Function):void {
        _els.push(listener);
    }

    public function remove(listener:Function):void {
        for (var i:int = 0; i < _els.length; i++) {
            if (_els[i] == listener) {
                _els.splice(i, 1);
                break;
            }
        }
    }

    public function dispatch(event:com.plter.two.events.Event = null, target:* = null):Boolean {
        var suc:Boolean = true;

        for (var i:int = 0; i < _els.length; i++) {
            if (!_els[i](event, target)) {
                suc = false;
            }
        }
        return suc;
    }
}
}
