import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cdr_today/widgets/alerts.dart';
import 'package:cdr_today/widgets/tiles.dart';
import 'package:cdr_today/widgets/buttons.dart';
import 'package:cdr_today/widgets/snackers.dart';
import 'package:cdr_today/blocs/community.dart';
import 'package:cdr_today/blocs/refresh.dart';
import 'package:cdr_today/x/req.dart' as xReq;
import 'package:cdr_today/x/_style/color.dart';
import 'package:cdr_today/x/store.dart';
import 'package:cdr_today/navigations/args.dart';

// members' view
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CtClose(),
        border: null,
      ),
      child: BlocBuilder<CommunityBloc, CommunityState>(
        builder: (context, state) {
          if (state is Communities) {
            var cs = state.communities;
            var community;
            for (var i in cs) {
              if (i['id'] == state.current) community = i;
            }

            return Column(
              children: [
                SizedBox(height: 8.0),
                ProfileTile(
                  leading: 'id',
                  trailing: Text(
                    community['id'],
                    style: TextStyle(color: CtColors.primary)
                  ),
                  // onTap: () async {
                  //   var mail = await getString('mail');
                  //   if (mail == community['owner']) {
                  //     Navigator.of(context).pushNamed(
                  //       '/mine/profile/name',
                  //       arguments: NameArgs(
                  //         name: community['id'],
                  //         profile: 'id',
                  //         id: community['id'],
                  //       )
                  //     );
                  //   }
                  // }
                ),
                SizedBox(height: 8.0),
                ProfileTile(
                  leading: '名字',
                  trailing: Text(
                    community['name'],
                    style: TextStyle(color: CtColors.primary)
                  ),
                  onTap: () async {
                    var mail = await getString('mail');
                    if (mail == community['owner']) {
                      Navigator.of(context).pushNamed(
                        '/mine/profile/name',
                        arguments: NameArgs(
                          name: community['name'],
                          profile: 'community',
                          id: community['id'],
                        )
                      );
                    }
                  }
                ),
                Spacer(),
                Builder(
                  builder: (context) => quit(context, community['id'])
                ),
                SizedBox(height: kToolbarHeight),
              ]
            );
          }
          return SizedBox.shrink();
        }
      )
    );
  }
}

// TODO: Owner's view
// ...
// common
Widget quit(BuildContext context, String id) {
  return Container(
    child: Center(
      child: GestureDetector(
        child: Text(
          '退出社区',
          style: TextStyle(fontSize: 14.0)
        ),
        onTap: () => alert(
          context,
          title: '退出社区?',
          action: () async {
            final xReq.Requests r = await xReq.Requests.init();
            final RefreshBloc _rbloc = BlocProvider.of<RefreshBloc>(context);
            final CommunityBloc _cbloc = BlocProvider.of<CommunityBloc>(context);
              
            var res = await r.quitCommunity(id: id);
            if (res.statusCode != 200) {
              snacker(context, '退出失败，请重试');
              Navigator.pop(context);
              return;
            } 

            _rbloc.dispatch(CommunityRefresh());
            _cbloc.dispatch(FetchCommunities());
            Navigator.pushNamedAndRemoveUntil(context, '/init', (_) => false);
          }
        )
      )
    ),
    margin: EdgeInsets.only(top: 20.0)
  );
}
