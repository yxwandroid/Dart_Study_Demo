main() {



  String strw = "小海2019-07-17支付了wilson发起的<_wc_custom_link_ color=\"#037AFF\" href=\"weixin://weixinnewaa/opendetail?billno=ba88296e41bc8a76e58ec19bfc6bc7aa83309d75774a3f74dbd485d256b3d01ecc55f6bce92c01f5cf69aa10449efacd\">群收款</_wc_custom_link_>";

//  strw.indexOf("<");

  print( strw.indexOf("<"));
  String sss =strw.substring(0,strw.indexOf("<"));
  print(sss);





//  String str = "<a href=\"weixin://findfriend/verifycontact\">发送朋友验证</a>";
//
//  print(str);
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

//  String filePath = "/storage/emulated/0/tencent/MicroMsg/WeiXin/mmexport1560820857375.jpg";
//  String fileName = filePath.substring(filePath.lastIndexOf("/")+1);
//
//
//  print(fileName);



////  1563269406988
////  1563269630965
//  var now = new DateTime.now().millisecondsSinceEpoch;
//
//
//  print(now);
//  print(1563269630965-1563269406988);
//   Set<UserInfo>  userinfo= Set();
//
//   UserInfo userInfo1= UserInfo();
//   userInfo1.name = "问";
//
//   userinfo.add(userInfo1);
//   userinfo.add(userInfo1);
//   userinfo.add(userInfo1);
//
//
//   print(userinfo.length);
}


class UserInfo{

  String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserInfo &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;



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
