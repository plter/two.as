///<reference path="../../../../../3rd/libs/3js/three.d.ts"/>
///<reference path="../display/Display.ts"/>
/**
 * Created by plter on 3/4/16.
 */
var com;
(function (com) {
    var plter;
    (function (plter) {
        var web2d;
        (function (web2d) {
            var core;
            (function (core) {
                var Tools = (function () {
                    function Tools() {
                    }
                    Tools.getDisplayFromObject3D = function (obj3d) {
                        return obj3d["display"];
                    };
                    return Tools;
                })();
                core.Tools = Tools;
            })(core = web2d.core || (web2d.core = {}));
        })(web2d = plter.web2d || (plter.web2d = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=Tools.js.map