///<reference path="../../../../../3rd/libs/3js/three.d.ts"/>
///<reference path="../Context.ts"/>
///<reference path="../events/EventListenerList.ts"/>
/**
 * Created by plter on 3/3/16.
 */
var com;
(function (com) {
    var plter;
    (function (plter) {
        var web2d;
        (function (web2d) {
            var display;
            (function (display) {
                var Display = (function () {
                    function Display(context, object3D) {
                        this._object3D = object3D;
                        this._context = context;
                        this._object3D["display"] = this;
                    }
                    Object.defineProperty(Display.prototype, "object3D", {
                        get: function () {
                            return this._object3D;
                        },
                        enumerable: true,
                        configurable: true
                    });
                    Object.defineProperty(Display.prototype, "context", {
                        get: function () {
                            return this._context;
                        },
                        enumerable: true,
                        configurable: true
                    });
                    Object.defineProperty(Display.prototype, "position", {
                        get: function () {
                            return this.object3D.position;
                        },
                        enumerable: true,
                        configurable: true
                    });
                    Object.defineProperty(Display.prototype, "rotation", {
                        get: function () {
                            return this.object3D.rotation;
                        },
                        enumerable: true,
                        configurable: true
                    });
                    return Display;
                })();
                display.Display = Display;
            })(display = web2d.display || (web2d.display = {}));
        })(web2d = plter.web2d || (plter.web2d = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=Display.js.map