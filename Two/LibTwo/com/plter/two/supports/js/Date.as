/**
 * Created by plter on 3/14/16.
 */
package com.plter.two.supports.js {
public class Date {

    private var _jsDate:*;

    public static function now():uint {
        return window['Date']['now']();
    }

    public function Date() {
        _jsDate = new window['Date'];
    }
}
}
