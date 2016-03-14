///<reference path="../../../../../3rd/libs/3js/three.d.ts"/>
///<reference path="Container.ts"/>
///<reference path="../events/EventListenerList.ts"/>
///<reference path="../Two.ts"/>
/**
 * Created by plter on 3/3/16.
 */

namespace com.plter.two.display {

    import EventListenerList = com.plter.two.events.EventListenerList;
    export class Scene2D extends Container {

        private _onUpdate:EventListenerList;

        constructor(context:com.plter.two.Two) {
            this._onUpdate = new EventListenerList();

            super(context);
        }

        update(dt:number):void {
        }


        get onUpdate():com.plter.two.events.EventListenerList {
            return this._onUpdate;
        }

        get two():com.plter.two.Two {
            return this.context as com.plter.two.Two;
        }

        get uiListeners():com.plter.two.events.EventListenerList {
            return this.two.eventListeners;
        }
    }
}