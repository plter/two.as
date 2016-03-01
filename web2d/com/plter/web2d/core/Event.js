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
                var Event = (function () {
                    function Event(name, data) {
                        if (name === void 0) { name = null; }
                        if (data === void 0) { data = null; }
                        this._data = null;
                        this._name = name;
                        this._data = data;
                    }
                    Object.defineProperty(Event.prototype, "name", {
                        get: function () {
                            return this._name;
                        },
                        enumerable: true,
                        configurable: true
                    });
                    Object.defineProperty(Event.prototype, "data", {
                        get: function () {
                            return this._data;
                        },
                        enumerable: true,
                        configurable: true
                    });
                    return Event;
                })();
                core.Event = Event;
            })(core = web2d.core || (web2d.core = {}));
        })(web2d = plter.web2d || (plter.web2d = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=Event.js.map