/**
 * Created by plter on 3/17/16.
 */
package com.plter.two.flash {
import org.apache.flex.events.Event;

public class SpriteSheetEvent extends org.apache.flex.events.Event {


    public static const COMPLETE:String = "complete";
    public static const ERROR:String = "error";

    public function SpriteSheetEvent(type:String) {
        super(type, false, false);
    }

    override public function cloneEvent():org.apache.flex.events.Event {
        return new SpriteSheetEvent(type);
    }
}
}
