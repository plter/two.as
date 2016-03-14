/**
 * Created by plter on 3/11/16.
 */
package {
import org.apache.flex.events.Event;
import org.apache.flex.events.EventDispatcher;

public class Main {
    public function Main() {

        var ed:EventDispatcher = new EventDispatcher();
        ed.addEventListener("theEvent",eventHandler);
        ed.dispatchEvent(new org.apache.flex.events.Event("theEvent"));
    }

    private function eventHandler(event:org.apache.flex.events.Event):void {
        window.console.log("Event dispatched");
    }
}
}
