/**
 * Created by plter on 3/22/16.
 */
package com.plter.two.display {
    import com.plter.two.app.Context;
    import com.plter.two.events.EventListenerList;

    public class Loader extends Display {

        private var _url:String;
        private var _onLoad:EventListenerList = new EventListenerList();
        private var _onError:EventListenerList = new EventListenerList();
        private var _content:Image;

        public function Loader(context:Context) {
            super(context);
        }

        public function load(url:String):void {
            _url = url;

            _content = new Image();
            _content.onload = imageOnLoadHandler;
            _content.onerror = imageOnErrorHandler;
            _content.src = url;
        }

        public function get url():String {
            return _url;
        }


        public function get onLoad():EventListenerList {
            return _onLoad;
        }

        public function get onError():EventListenerList {
            return _onError;
        }

        public function get content():Image {
            return _content;
        }

        private function imageOnLoadHandler():void {
            setSizeInPixel(_content.width, _content.height);
            context2d.save();
            context2d.drawImage(_content, 0, 0);
            context2d.restore();
            updateTexture();

            onLoad.dispatch(null, this);
        }

        private function imageOnErrorHandler():void {
            onError.dispatch(null, this);
        }
    }
}
