///<reference path="Event.ts"/>
/**
 * Created by plter on 3/7/16.
 */


namespace com.plter.two.events {

    import Event = com.plter.two.events.Event;

    export class MouseEvent extends Event {


        private _relatedEvent:any = null;
        private _x:number;
        private _y:number;

        constructor(name:string, x:number, y:number, relatedEvent:any) {
            super(name);

            this._x = x;
            this._y = y;
            this._relatedEvent = relatedEvent;
        }


        get relatedEvent():any {
            return this._relatedEvent;
        }


        get x():number {
            return this._x;
        }

        get y():number {
            return this._y;
        }
    }
}