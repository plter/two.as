/**
 * Created by plter on 3/24/16.
 */
package com.plter.two.net {

    public class Connection {

        private var _xhr:XMLHttpRequest;
        private var _openHandler:Function = null;
        private var _sentHandler:Function = null;
        private var _receivingHandler:Function = null;
        private var _loadedHandler:Function = null;
        private var _successHandler:Function = null;
        private var _errorHandler:Function = null;

        public function Connection() {
            _xhr = new XMLHttpRequest();
            _xhr.onreadystatechange = _xhr_readyStateChangeHandler;
        }

        public function send(url:String, method:String = "GET", data:* = null):Connection {
            _xhr.open(method, url);
            _xhr.send(data);
            return this;
        }

        public function onOpen(openHandler:Function):Connection {
            _openHandler = openHandler;
            return this;
        }

        public function onSent(sentHandler:Function):Connection {
            _sentHandler = sentHandler;
            return this;
        }

        public function onReceiving(receivingHandler:Function):Connection {
            _receivingHandler = receivingHandler;
            return this;
        }

        public function onLoaded(loadedHandler:Function):Connection {
            _loadedHandler = loadedHandler;
            return this;
        }

        public function onSuccess(successHandler:Function):Connection {
            _successHandler = successHandler;
            return this;
        }

        public function onError(errorHandler:Function):Connection {
            _errorHandler = errorHandler;
            return this;
        }

        private function _xhr_readyStateChangeHandler():void {
            switch (_xhr.readyState) {
                case 1:
                    if (_openHandler) {
                        _openHandler(null, this);
                    }
                    break;
                case 2:
                    if (_sentHandler) {
                        _sentHandler(null, this);
                    }
                    break;
                case 3:
                    if (_receivingHandler) {
                        _receivingHandler(null, this);
                    }
                    break;
                case 4:
                    if (_xhr.status == 200) {
                        if (_successHandler) {
                            _successHandler(new ConnectionEvent(ConnectionEvent.SUCCESS, _xhr.responseText), this);
                        }
                    } else {
                        if (_errorHandler) {
                            _errorHandler(new ConnectionEvent(ConnectionEvent.ERROR, null, _xhr.status), this);
                        }
                    }

                    if (_loadedHandler) {
                        _loadedHandler();
                    }
                    break;
            }
        }
    }
}
