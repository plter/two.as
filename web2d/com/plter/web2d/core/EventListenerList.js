///<reference path="ArrayTools.ts"/>
///<reference path="Event.ts"/>
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
                var EventListenerList = (function () {
                    function EventListenerList() {
                        this.list = [];
                    }
                    EventListenerList.prototype.add = function (listener) {
                        this.list.push(listener);
                    };
                    EventListenerList.prototype.remove = function (listener) {
                        core.ArrayTools.deleteFromArray(listener, this.list);
                    };
                    /**
                     *
                     * @param event
                     * @param sender
                     * @returns {boolean} If one of listeners returns false,and this function will return false
                     */
                    EventListenerList.prototype.dispatch = function (event, sender) {
                        if (event === void 0) { event = null; }
                        if (sender === void 0) { sender = null; }
                        var suc = true;
                        for (var i = 0; i < this.list.length; i++) {
                            if (!this.list[i](event, sender)) {
                                suc = false;
                            }
                        }
                        return suc;
                    };
                    return EventListenerList;
                })();
                core.EventListenerList = EventListenerList;
            })(core = web2d.core || (web2d.core = {}));
        })(web2d = plter.web2d || (plter.web2d = {}));
    })(plter = com.plter || (com.plter = {}));
})(com || (com = {}));
//# sourceMappingURL=EventListenerList.js.map