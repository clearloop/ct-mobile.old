import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cdr_today/blocs/refresh.dart';

class CommunityRefresher extends StatelessWidget {
  final Widget widget;
  CommunityRefresher({ this.widget });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RefreshBloc, RefreshState>(
      builder: (context, state) {
        if ((state as Refresher).community == true) {
          return CupertinoActivityIndicator(radius: 8.0);
        }
        return widget ?? SizedBox.shrink();
      }
    );
  }
}

class EditRefresher extends StatelessWidget {
  final bool empty;
  final Widget widget;
  EditRefresher({ this.empty = false, this.widget });
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RefreshBloc, RefreshState>(
      builder: (context, state) {
        if ((state as Refresher).edit) {
          if (empty == true) return SizedBox.shrink();
          return CupertinoActivityIndicator();
        }

        return widget;
      }
    );
  }
}

class ProfileRefresher extends StatelessWidget {
  final Widget widget;
  ProfileRefresher({ this.widget });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RefreshBloc, RefreshState>(
      builder: (context, state) {
        if ((state as Refresher).profile == true) {
          return CupertinoActivityIndicator();
        }
        return widget ?? SizedBox.shrink();
      }
    );
  }
}

class QrRefresher extends StatelessWidget {
  final Widget widget;
  QrRefresher({ this.widget });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RefreshBloc, RefreshState>(
      builder: (context, state) {
        if ((state as Refresher).qr == true) {
          return Container(
            height: 16.0,
            width: 22.0,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
            ),
            padding: EdgeInsets.only(right: 6.0),
            alignment: Alignment.center
          );
        }
        return widget ?? SizedBox.shrink();
      }
    );
  }
}


class CupertinoRefresher extends StatelessWidget {
  final Widget widget;
  CupertinoRefresher({ this.widget });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RefreshBloc, RefreshState>(
      builder: (context, state) {
        if ((state as Refresher).cupertino == true) {
          return CupertinoActivityIndicator();
        }
        return widget ?? SizedBox.shrink();
      }
    );
  }
}
