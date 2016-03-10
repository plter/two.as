/**
 * Created by plter on 3/3/16.
 */
var com;
(function (com) {
    var plter;
    (function (plter) {
        var two;
        (function (two) {
            var Context = (function () {
                function Context() {
                }
                Object.defineProperty(Context.prototype, "stageWidth", {
                    get: function () {
                        return this._stageWidth;
                    },
                    set: function (value) {
                        this._stageWidth = value;
                    },
                    enumerable: true,
                    configurable: true
                });
                Object.defineProperty(Context.prototype, "stageHeight", {
                    get: function () {
                        return this._stageHeight;
                    },
                    set: function (value) {
                        this._stageHeight = value;
                    },
                    enumerable: true,
                    configurable: true
                });
                return Context;
            })();
            two.Context = Context;
        })(two = plter.two || (plter.two = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=Context.js.map