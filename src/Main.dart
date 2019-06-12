import 'dart:async';

main() {

//  String ss = "[微笑][微笑][微笑]";
  String ss = "[微笑][微笑][微笑]恩恩[微w笑]dd[微笑]";
  print( getContents(ss));


}



///获取文本数组
List<String> getContents(String content) {
  var emojiReg = new RegExp("(\\[.+?\\])");
  var emojiMatches = emojiReg.allMatches(content);

  List<String> emojis = new List();
  for (Match m in emojiMatches) {
    String match = m.group(0);
    emojis.add(match);
  }

  String itemStr = content;
  for (String item in emojis) {
    itemStr = itemStr.replaceAll(item, "&");
  }

  var itemSps = itemStr.split("&");
  List<String> tempArr = new List();
  for (String item in itemSps) {
    if (item != null && item != "") {
      tempArr.add(item);
    }
  }
  tempArr.addAll(emojis);

  Map<int, String> mapStr = new Map();
  for (int i = 0; i < tempArr.length; i++) {
    String item = tempArr[i];
    int itemLeng = item.length;
    int itemPoision = content.indexOf(item);
    while(itemPoision!=-1){
      String itemStr = content.substring(itemPoision, itemPoision + itemLeng);
      mapStr[itemPoision] = itemStr;
      itemPoision+=item.length;//每找到一次返回下标
      /*这里需要注意的细节是length是字符串的方法，是数组的属性。所以求字符串长度应该是.length（），而不是.length
			 *
			 * 这里就是说  第一次朋友找到了  count加1之后  继续接着找，
			 * 这个时候就从“你” 开始找了   第二次找到之后  就从“，"开始找了
			 * 找到之后  又从“们”开始找.....
			 * indexOf两个参数  一个是要找的字符串，一个是从哪个下标开始找
			 * */
      itemPoision=content.indexOf(item,itemPoision);//指定从哪个位置的下标往后找
    }

//    String itemStr = content.substring(itemPoision, itemPoision + itemLeng);
//    mapStr[itemPoision] = itemStr;
  }

  var sortedKeys = mapStr.keys.toList()..sort();
  List<String> contentArr = new List();
  for (int item in sortedKeys) {
    contentArr.add(mapStr[item]);
  }

  return contentArr;
}
