///<reference path="ArrayTools.ts"/>
///<reference path="Event.ts"/>
/**
 * Created by plter on 2/29/16.
 */

namespace com.plter.web2d.core {

    export class EventListenerList {
        private list:Array<(e:Event, a:any)=>boolean> = [];

        constructor() {
        }

        public add(listener:(e:Event, a:any)=>boolean):void {
            this.list.push(listener);
        }

        public remove(listener:(e:Event, a:any)=>boolean):void {
            ArrayTools.deleteFromArray(listener, this.list);
        }


        /**
         *
         * @param event
         * @param sender
         * @returns {boolean} If one of listeners returns false,and this function will return false
         */
        public dispatch(event:Event = null, sender:any = null):boolean {
            var suc:boolean = true;

            for (var i = 0; i < this.list.length; i++) {
                if (!this.list[i](event, sender)) {
                    suc = false;
                }
            }

            return suc;
        }
    }

}