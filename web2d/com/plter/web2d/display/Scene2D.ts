///<reference path="../../../../../3rd/libs/3js/three.d.ts"/>
///<reference path="Container.ts"/>
///<reference path="../core/EventListenerList.ts"/>
/**
 * Created by plter on 3/3/16.
 */

namespace com.plter.web2d.display {

    import EventListenerList = com.plter.web2d.core.EventListenerList;
    export class Scene2D extends Container {

        private _onUpdate:EventListenerList;

        constructor(context:Context) {
            this._onUpdate = new EventListenerList();

            super(context);
        }

        update(dt:number):void {
        }


        get onUpdate():com.plter.web2d.core.EventListenerList {
            return this._onUpdate;
        }
    }
}