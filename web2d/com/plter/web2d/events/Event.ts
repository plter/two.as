/**
 * Created by plter on 2/29/16.
 */

namespace com.plter.web2d.events {

    export class Event {

        private _name:string;
        private _data = null;

        constructor(name:string = null, data = null) {
            this._name = name;
            this._data = data;
        }

        public get name():string {
            return this._name;
        }

        public get data() {
            return this._data;
        }
    }
}