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
            var tools;
            (function (tools) {
                var Tools = (function () {
                    function Tools() {
                    }
                    Tools.getDisplayFromObject3D = function (obj3d) {
                        return obj3d["display"];
                    };
                    return Tools;
                })();
                tools.Tools = Tools;
            })(tools = web2d.tools || (web2d.tools = {}));
        })(web2d = plter.web2d || (plter.web2d = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=Tools.js.map