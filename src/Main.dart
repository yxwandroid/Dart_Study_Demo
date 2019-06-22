main() {
//  String str = "[微笑]";
//  String str = "[坏笑][左哼哼]";
//  String str = "你好[坏笑][左哼哼][右哼哼]你好那你";
//  String str = "[坏dd笑]恩问问[左哼哼]呃呃呃[右哼哼]试试的";
//  String ss ='[转圈][转圈][转圈][转圈]';
//
////  int itemPoision = ss.indexOf("[转圈");
////  String sb= ss.replaceFirst("[转圈]", "21",itemPoision);
////  print(sb);

//  String sb = "云客服任务进度和迭代计划.pdf";
//  int  lastIndex = sb.lastIndexOf(".");
//  print(sb.substring(lastIndex+1));


//  DateTime now = new DateTime.now();
//  print((now.millisecondsSinceEpoch));

 // print(getContents(sb));

  String filePath = "/storage/emulated/0/tencent/MicroMsg/WeiXin/mmexport1560820857375.jpg";
  String fileName = filePath.substring(filePath.lastIndexOf("/")+1);


  print(fileName);


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
    if (item != null&&item!="") {
      tempArr.add(item);
    }
  }
  tempArr.addAll(emojis);

  Map<int, String> mapStr = new Map();
  String tempContent= content;
  for (int i = 0; i < tempArr.length; i++) {
    String item = tempArr[i];
    int itemLeng = item.length;
    int itemPoision = tempContent.indexOf(item);
    tempContent=tempContent.replaceFirst(item, "&&&&",itemPoision);
    String itemStr = content.substring(itemPoision, itemPoision + itemLeng+1);
    mapStr[itemPoision] = itemStr;
  }

  var sortedKeys = mapStr.keys.toList()..sort();
  List<String> contentArr = new List();
  for (int item in sortedKeys) {
    contentArr.add(mapStr[item]);
  }

  return contentArr;
}
