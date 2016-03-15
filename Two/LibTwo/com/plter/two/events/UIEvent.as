/**
 * Created by plter on 3/15/16.
 */
package com.plter.two.events {
import org.apache.flex.events.Event;

public class UIEvent extends org.apache.flex.events.Event {

    public static const CLICK:String = "click";

    public function UIEvent(type:String) {
        super(type, false, false);
    }
}
}
