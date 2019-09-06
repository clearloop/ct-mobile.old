import 'package:flutter/material.dart';
import 'package:cdr_today/blocs/user.dart';
import 'package:cdr_today/blocs/article_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cdr_today/navigations/args.dart';

class Mine extends StatelessWidget {
  Widget build(BuildContext context) {
    final UserBloc _bloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInited) {
          return ListView(
            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            children: <Widget>[
              profile(context),
              articles(context),
              version(context),
              logout(context),
            ]
          );
        } else {
          _bloc.dispatch(CheckUserEvent());
          return Center(child: Text('重新登录中...'));
        }
      }
    );
  }
}

// ----------- tiles -------------
Widget profile(BuildContext context) {
  return Container(
    child: Card(
      child: ListTile(
        title: Text('个人信息'),
        onTap: () => Navigator.pushNamed(context, '/mine/profile')
      )
    ),
    margin: EdgeInsets.only(top: 10.0)
  );
}

Widget articles(BuildContext context) {
  return Container(
    child: Card(
      child: ListTile(
        title: Text('文章管理'),
        onTap: () => Navigator.pushNamed(context, '/mine/article/manager')
      )
    ),
    margin: EdgeInsets.only(top: 10.0)
  );
}

Widget version(BuildContext context) {
  return Container(
    child: Card(
      child: ListTile(
        title: Text('版本信息'),
        onTap: () => Navigator.pushNamed(context, '/mine/version')
      )
    ),
    margin: EdgeInsets.only(top: 10.0)
  );
}

Widget logout(BuildContext context) {
  final UserBloc _bloc = BlocProvider.of<UserBloc>(context);
  final ArticleListBloc _albloc = BlocProvider.of<ArticleListBloc>(context);
  
  return Container(
    child: Center(
      child: GestureDetector(
        child: Text(
          '退出登录',
          style: TextStyle(fontSize: 14.0)
        ),
        onTap: () {
          _bloc.dispatch(LogoutEvent());
          _albloc.dispatch(CleanList());
        }
      )
    ),
    margin: EdgeInsets.only(top: 20.0)
  );
}
