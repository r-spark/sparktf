package sparktf

object StringUtil {

   def StringToMap(rawString) {
       rawString.substring(1, rawString.length - 1)
                .split(",")
                .map(_.split(":"))
                .map { case Array(k, v) => (k.substring(1, k.length-1), v.substring(1, v.length-1))}
                .toMap
   }
}
