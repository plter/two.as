/**
 * Created by plter on 2/29/16.
 */
var com;
(function (com) {
    var plter;
    (function (plter) {
        var two;
        (function (two) {
            var tools;
            (function (tools) {
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
                tools.ArrayTools = ArrayTools;
            })(tools = two.tools || (two.tools = {}));
        })(two = plter.two || (plter.two = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=ArrayTools.js.map