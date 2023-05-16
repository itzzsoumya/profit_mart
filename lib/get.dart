import 'dart:convert';

List<Post> postFromJson(String str) {
  return List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
}

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  String msg="";
  String researcher="";
  String closedate="";
  String bpp="";
  int lastupdatetime=0;
  double stoploss=0;
  String clcode="";
  String cmp="";
  String bfl="";
  String bfp="";
  String mobileos="";
  String target="";
  String buysell="";
  String market="";
  String call="";
  String closeratefortarget="";
  String closerateforcmp="";
  int days=0;
  int logid=0;
  String exchange="";
  String closerateforsl="";
  DateTime sendtime=DateTime.now();
  String msgtype="";
  String status="";

  Post({
    required this.msg,
    required this.researcher,
    required this.closedate,
    required this.bpp,
    required this.lastupdatetime,
    required this.stoploss,
    required this.clcode,
    required this.cmp,
    required this.bfl,
    required this.bfp,
    required this.mobileos,
    required this.target,
    required this.buysell,
    required this.market,
    required this.call,
    required this.closeratefortarget,
    required this.closerateforcmp,
    required this.days,
    required this.logid,
    required this.exchange,
    required this.closerateforsl,
    required this.sendtime,
    required this.msgtype,
    required this.status,
  });

  Post.fromJson(Map<String, dynamic> json){
    msg= json["msg"];
    researcher=json["researcher"];
    closedate= json["closedate"];
    bpp=json["bpp"];
    lastupdatetime=json["lastupdatetime"];
    stoploss= json["stoploss"]?.toDouble();
    clcode= json["clcode"];
    cmp= json["cmp"];
    bfl= json["bfl"];
    bfp= json["bfp"];
    mobileos= json["mobileos"];
    target= json["target"];
    buysell= json["buysell"];
    market= json["market"];
    call= json["call"];
    closeratefortarget= json["closeratefortarget"];
    closerateforcmp= json["closerateforcmp"];
    days= json["days"];
    logid= json["logid"];
    exchange= json["exchange"];
    closerateforsl= json["closerateforsl"];
    sendtime= DateTime.parse(json["sendtime"]);
    msgtype= json["msgtype"];
    status= json["status"];
  }

  // factory Post.fromJson(Map<String, dynamic> json) => Post(
  //   msg: json["msg"],
  //   researcher:json["researcher"]!,
  //   closedate: json["closedate"],
  //   bpp: json["bpp"],
  //   lastupdatetime: json["lastupdatetime"],
  //   stoploss: json["stoploss"]?.toDouble(),
  //   clcode: json["clcode"]!,
  //   cmp: json["cmp"],
  //   bfl: json["bfl"],
  //   bfp: json["bfp"],
  //   mobileos: json["mobileos"]!,
  //   target: json["target"],
  //   buysell: json["buysell"]!,
  //   market: json["market"]!,
  //   call: json["call"]!,
  //   closeratefortarget: json["closeratefortarget"],
  //   closerateforcmp: json["closerateforcmp"],
  //   days: json["days"],
  //   logid: json["logid"],
  //   exchange: json["exchange"]!,
  //   closerateforsl: json["closerateforsl"],
  //   sendtime: DateTime.parse(json["sendtime"]),
  //   msgtype: json["msgtype"],
  //   status: json["status"],
  // );

  Map<String, dynamic> toJson() => {

    "msg": msg,
    "researcher": researcher,
    "closedate": closedate,
    "bpp": bpp,
    "lastupdatetime": lastupdatetime,
    "stoploss": stoploss,
    "clcode": clcode,
    "cmp": cmp,
    "bfl": bfl,
    "bfp": bfp,
    "mobileos":mobileos,
    "target": target,
    "buysell": buysell,
    "market": market,
    "call": call,
    "closeratefortarget": closeratefortarget,
    "closerateforcmp": closerateforcmp,
    "days": days,
    "logid": logid,
    "exchange": exchange,
    "closerateforsl": closerateforsl,
    "sendtime": sendtime.toIso8601String(),
    "msgtype": msgtype,
    "status": status,
  };
}
