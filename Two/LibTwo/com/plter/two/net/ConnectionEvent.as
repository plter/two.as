/**
 * Created by plter on 3/24/16.
 */
package com.plter.two.net {
import com.plter.two.events.TEvent;

public class ConnectionEvent extends TEvent {


    public static const SUCCESS:String = "success";
    public static const ERROR:String = "error";

    private var _status:uint;

    public function ConnectionEvent(name:String, data:*, status:uint = 200) {
        _status = status;
        super(name, data);
    }

    public function get status():uint {
        return _status;
    }
}
}
