import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cdr_today/blocs/member.dart';
import 'package:cdr_today/widgets/avatar.dart';
import 'package:cdr_today/widgets/community.dart';

class CommunityMember extends StatelessWidget {
  final SliverAppBar appBar;
  CommunityMember({ this.appBar });
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        appBar,
        BlocBuilder<MemberBloc, MemberState>(
          builder: (context, state) {
            if (state is MemberFetchedSucceed) {
              var ms = state.members;
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (index == 0) return SizedBox(height: 8.0);
                    return index.isOdd ? CommunityTile(
                      avatar: AvatarHero(
                        width: 20.0,
                        url: ms[index ~/ 2]['avatar'],
                        tag: ms[index ~/ 2]['avatar'],
                      ),
                      name: Text(ms[index ~/ 2]['name']),
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 8.0,
                      )
                    ) : Divider();
                  },
                  childCount: state.members.length * 2,
                )
              );
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SizedBox.shrink();
                }
              )
            );
          }
        )
      ]
    );
  }
}