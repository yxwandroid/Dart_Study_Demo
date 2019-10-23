main(){
 // print("e");

  List<String> tempStr=List();

  tempStr.add("11231");
  tempStr.add("3231");
  tempStr.add("11");
  tempStr.add("131");
  tempStr.add("1333331");
  tempStr.add("1133");
  tempStr.add("1331");
  tempStr.add("121");



  String  ss= getItem(tempStr);
  print(ss);

}


String getItem(List<String> tempStr){
  String  itemee ="" ;

  tempStr.forEach((item){
    if(item=="1eee1"){
      itemee = item;
    }else{
      itemee = null;
    }


  });
  return itemee;
}