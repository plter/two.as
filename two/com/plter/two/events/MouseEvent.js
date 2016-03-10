///<reference path="Event.ts"/>
/**
 * Created by plter on 3/7/16.
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
            var events;
            (function (events) {
                var Event = com.plter.two.events.Event;
                var MouseEvent = (function (_super) {
                    __extends(MouseEvent, _super);
                    function MouseEvent(name, x, y, relatedEvent) {
                        _super.call(this, name);
                        this._relatedEvent = null;
                        this._x = x;
                        this._y = y;
                        this._relatedEvent = relatedEvent;
                    }
                    Object.defineProperty(MouseEvent.prototype, "relatedEvent", {
                        get: function () {
                            return this._relatedEvent;
                        },
                        enumerable: true,
                        configurable: true
                    });
                    Object.defineProperty(MouseEvent.prototype, "x", {
                        get: function () {
                            return this._x;
                        },
                        enumerable: true,
                        configurable: true
                    });
                    Object.defineProperty(MouseEvent.prototype, "y", {
                        get: function () {
                            return this._y;
                        },
                        enumerable: true,
                        configurable: true
                    });
                    return MouseEvent;
                })(Event);
                events.MouseEvent = MouseEvent;
            })(events = two.events || (two.events = {}));
        })(two = plter.two || (plter.two = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=MouseEvent.js.map