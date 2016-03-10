///<reference path="../../../../../3rd/libs/3js/three.d.ts"/>
///<reference path="Container.ts"/>
///<reference path="../events/EventListenerList.ts"/>
///<reference path="../Web2D.ts"/>
/**
 * Created by plter on 3/3/16.
 */

namespace com.plter.web2d.display {

    import EventListenerList = com.plter.web2d.events.EventListenerList;
    export class Scene2D extends Container {

        private _onUpdate:EventListenerList;

        constructor(context:com.plter.web2d.Web2D) {
            this._onUpdate = new EventListenerList();

            super(context);
        }

        update(dt:number):void {
        }


        get onUpdate():com.plter.web2d.events.EventListenerList {
            return this._onUpdate;
        }

        get web2d():com.plter.web2d.Web2D {
            return this.context as com.plter.web2d.Web2D;
        }

        get uiListeners():com.plter.web2d.events.EventListenerList {
            return this.web2d.eventListeners;
        }
    }
}