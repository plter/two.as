/**
 * Created by plter on 2/29/16.
 */
var com;
(function (com) {
    var plter;
    (function (plter) {
        var web2d;
        (function (web2d) {
            var core;
            (function (core) {
                var ArrayTools = (function () {
                    function ArrayTools() {
                    }
                    /**
                     * If find the obj it will delete the first obj that found,or do nothing
                     * @param obj
                     * @param arr
                     */
                    ArrayTools.deleteFromArray = function (obj, arr) {
                        for (var i = 0; i < arr.length; i++) {
                            if (arr[i] == obj) {
                                arr.splice(i, 1);
                                break;
                            }
                        }
                    };
                    return ArrayTools;
                })();
                core.ArrayTools = ArrayTools;
            })(core = web2d.core || (web2d.core = {}));
        })(web2d = plter.web2d || (plter.web2d = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=ArrayTools.js.map