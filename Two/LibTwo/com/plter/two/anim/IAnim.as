package com.plter.two.anim {

    public interface IAnim {
        function start():void;
        function set completeHandler(v:Function):void;
        function get completeHandler():Function;
        function reverse():IAnim;
    }
}
