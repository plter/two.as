///<reference path="../../web2d/com/plter/web2d/tools/EventListenerList.ts"/>

/**
 * Created by plter on 3/1/16.
 */

namespace plter {

    export class App {


        private static __ins:App = null;

        public static getInstance():App {
            if (App.__ins == null) {
                App.__ins = new App();
            }
            return App.__ins;
        }


        constructor() {
            var ell:com.plter.web2d.core.EventListenerList = new com.plter.web2d.core.EventListenerList();
            ell.add(function (e:Event, sender:any):boolean {
                console.log("Event dispatched");
                return true;
            }.bind(this));
            ell.dispatch();
        }
    }
}





plter.App.getInstance();



