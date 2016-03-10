///<reference path="../../../../../3rd/libs/3js/three.d.ts"/>
///<reference path="Container.ts"/>
///<reference path="../events/EventListenerList.ts"/>
///<reference path="../Two.ts"/>
/**
 * Created by plter on 3/3/16.
 */
var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
var com;
(function (com) {
    var plter;
    (function (plter) {
        var two;
        (function (two) {
            var display;
            (function (display) {
                var EventListenerList = com.plter.two.events.EventListenerList;
                var Scene2D = (function (_super) {
                    __extends(Scene2D, _super);
                    function Scene2D(context) {
                        this._onUpdate = new EventListenerList();
                        _super.call(this, context);
                    }
                    Scene2D.prototype.update = function (dt) {
                    };
                    Object.defineProperty(Scene2D.prototype, "onUpdate", {
                        get: function () {
                            return this._onUpdate;
                        },
                        enumerable: true,
                        configurable: true
                    });
                    Object.defineProperty(Scene2D.prototype, "two", {
                        get: function () {
                            return this.context;
                        },
                        enumerable: true,
                        configurable: true
                    });
                    Object.defineProperty(Scene2D.prototype, "uiListeners", {
                        get: function () {
                            return this.two.eventListeners;
                        },
                        enumerable: true,
                        configurable: true
                    });
                    return Scene2D;
                })(display.Container);
                display.Scene2D = Scene2D;
            })(display = two.display || (two.display = {}));
        })(two = plter.two || (plter.two = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=Scene2D.js.map