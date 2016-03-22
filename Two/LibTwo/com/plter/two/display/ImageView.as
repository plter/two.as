/**
 * Created by plter on 3/22/16.
 */
package com.plter.two.display {
import com.plter.two.app.Context;
import com.plter.two.events.EventListenerList;

public class ImageView extends Display {

    private var _url:String;
    private var _onLoad:EventListenerList = new EventListenerList();
    private var _onError:EventListenerList = new EventListenerList();
    private var _image:Image;

    public function ImageView(context:Context) {
        super(context);
    }

    public function load(url:String):void {
        _url = url;

        _image = new Image();
        _image.onload = imageOnLoadHandler;
        _image.onerror = imageOnErrorHandler;
        _image.src = url;
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

    private function imageOnLoadHandler():void {
        setSizeInPixel(_image.width, _image.height);

        context2d.drawImage(_image, 0, 0);
        updateTexture();

        onLoad.dispatch(null, this);
    }

    private function imageOnErrorHandler():void {
        onError.dispatch(null, this);
    }
}
}
