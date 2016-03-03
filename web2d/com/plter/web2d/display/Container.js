///<reference path="Display.ts"/>
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
        var web2d;
        (function (web2d) {
            var display;
            (function (display_1) {
                var Container = (function (_super) {
                    __extends(Container, _super);
                    function Container(context, object3D) {
                        _super.call(this, context, object3D);
                    }
                    Container.prototype.remove = function (display) {
                        this.object3D.remove(display.object3D);
                    };
                    Container.prototype.add = function (display) {
                        this.object3D.add(display.object3D);
                    };
                    return Container;
                })(display_1.Display);
                display_1.Container = Container;
            })(display = web2d.display || (web2d.display = {}));
        })(web2d = plter.web2d || (plter.web2d = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=Container.js.map