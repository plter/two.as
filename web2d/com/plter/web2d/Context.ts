/**
 * Created by plter on 3/3/16.
 */

namespace com.plter.web2d {


    export class Context {
        private _stageWidth:number;
        private _stageHeight:number;


        get stageWidth():number {
            return this._stageWidth;
        }

        set stageWidth(value:number) {
            this._stageWidth = value;
        }

        get stageHeight():number {
            return this._stageHeight;
        }

        set stageHeight(value:number) {
            this._stageHeight = value;
        }
    }
}