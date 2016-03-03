///<reference path="../../web2d/com/plter/web2d/core/EventListenerList.ts"/>
/**
 * Created by plter on 3/1/16.
 */
var plter;
(function (plter) {
    var App = (function () {
        function App() {
            var ell = new com.plter.web2d.core.EventListenerList();
            ell.add(function (e, sender) {
                console.log("Event dispatched");
                return true;
            }.bind(this));
            ell.dispatch();
        }
        App.getInstance = function () {
            if (App.__ins == null) {
                App.__ins = new App();
            }
            return App.__ins;
        };
        App.__ins = null;
        return App;
    })();
    plter.App = App;
})(plter || (plter = {}));
plter.App.getInstance();
//# sourceMappingURL=App.js.map