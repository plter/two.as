/**
 * Created by plter on 3/22/16.
 */
package com.plter.two.tools {
public class MathTool {
    public static function resetNumberToNearPower2(value:Number):Number {
        return Math.pow(2, Math.ceil((Math.log(value) * Math.LOG2E)))
    }
}
}
