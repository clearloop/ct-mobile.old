import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cdr_today/widgets/input.dart';
import 'package:cdr_today/widgets/snackers.dart';
import 'package:cdr_today/x/req.dart' as xReq;

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  String _id;
  String _name;
  
  void changeId(String value) {
    setState(() { _id = value; });
  }

  void changeName(String value) {
    setState(() { _name = value; });
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('创建社区'),
        leading: CloseButton(),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.check),
              onPressed: () => createCommunity(context)
            )
          )
        ]
      ),
      body: Column(
        children: [
          Input(
            helper: '社区 ID: 用于社区搜索，具有唯一性要求。',
            onChanged: changeId,
          ),
          SizedBox(height: 10.0),
          Input(
            helper: '社区名称: 可随意设置。',
            onChanged: changeName,
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
    );
  }

  createCommunity(BuildContext context) async {
    final xReq.Requests r = await xReq.Requests.init();
    bool _idValid = RegExp(r"^[a-zA-Z0-9_]{1,20}$").hasMatch(_id);
    if (!_idValid) {
      snacker(context, '社区 ID 只能使用字母数字与下划线 "_"，长度需小于 20', secs: 2);
      return;
    }

    bool _nameValid = RegExp(r"^[\u4e00-\u9fa5_a-zA-Z0-9]{1,20}$").hasMatch(_name);
    if (!_nameValid) {
      snacker(
        context,
        '社区名称能够使用字母数字与下划线 "_"，以及中文字符，长度需小于 20',
        secs: 2
      );
      return;
    }
    
    var res = await r.createCommunity(id: _id, name: _name);
    if (res.statusCode != 200) {
      snacker(context, '创建失败，请重试');
      return;
    }

    Navigator.maybePop(context);
    Navigator.maybePop(context);
  }
} 

// ---------- API ---------
// class CreateCommunityResult {
//   final String msg;
//   CreateCommunityResult({ this.msg });
//   
//   factory CreateCommunityResult.fromJson(Map<String, dynamic> json) {
//     return CreateCommunityResult( msg: json['msg'] );
//   }
// }