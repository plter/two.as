/**
 * Created by plter on 2/29/16.
 */


namespace com.plter.web2d.core {
    export class ArrayTools {

        /**
         * If find the obj it will delete the first obj that found,or do nothing
         * @param obj
         * @param arr
         */
        public static deleteFromArray(obj, arr):void {
            for (var i = 0; i < arr.length; i++) {
                if (arr[i] == obj) {
                    arr.splice(i, 1);
                    break;
                }
            }
        }
    }
}