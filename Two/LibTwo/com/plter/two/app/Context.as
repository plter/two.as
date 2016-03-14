/**
 * Created by plter on 3/12/16.
 */
package com.plter.two.app {
public class Context {

    private var _stage:Stage;

    public function Context() {
        _stage = new Stage();
    }

    public function get stage():Stage {
        return _stage;
    }
}
}
