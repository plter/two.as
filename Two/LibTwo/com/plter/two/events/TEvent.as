/**
 * Created by plter on 3/17/16.
 */
package com.plter.two.events {
public class TEvent {

    private var _name:String;
    private var _data:*;

    public function TEvent(name:String, data:*) {
        _name = name;
        _data = data;
    }

    public function get name():String {
        return _name;
    }

    public function get data():* {
        return _data;
    }
}
}
