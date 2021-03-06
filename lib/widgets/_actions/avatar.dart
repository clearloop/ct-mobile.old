import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:cdr_today/widgets/alerts.dart';
import 'package:cdr_today/widgets/buttons.dart';
import 'package:cdr_today/blocs/refresh.dart';
import 'package:cdr_today/blocs/user.dart';
import 'package:cdr_today/x/req.dart' as xReq;
import 'package:cdr_today/x/permission.dart' as pms;

// avatar actions
class Avatar extends StatelessWidget {
  final ScreenshotController screenshotController;
  final BuildContext sContext;
  
  Avatar({ this.screenshotController, this.sContext });
  
  void pickImage(BuildContext context) async {
    final xReq.Requests r = await xReq.Requests.init();
    final UserBloc _ubloc = BlocProvider.of<UserBloc>(context);
    final RefreshBloc _bloc = BlocProvider.of<RefreshBloc>(context);

    if (await pms.checkPhotos(context) != true) {
      Navigator.pop(context);
      return;
    }
    
    if (await pms.checkStorage(context) != true) {
      Navigator.pop(context);
      return;
    }

    Navigator.pop(context);
    File file = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512.0,
    );
    
    if (file == null) return;
    file = await ImageCropper.cropImage(
      sourcePath: file.path,
      ratioX: 1.0,
      ratioY: 1.0,
      toolbarTitle: '',
    );

    if (file == null) return;
    String image = base64Encode(file.readAsBytesSync());

    _bloc.dispatch(Refresh(profile: true));
    var res = await r.upload(image: image);
    if (res.statusCode != 200) {
      _bloc.dispatch(Refresh(profile: false));
      info(sContext, '图片上传失败，请重试');
      return;
    }

    res = await r.updateAvatar(avatar: json.decode(res.body)['image']);
    if (res.statusCode != 200) {
      _bloc.dispatch(Refresh(profile: false));
      info(sContext, '头像修改失败，请重试');
      return;
    }

    _ubloc.dispatch(InitUserEvent(avatar: json.decode(res.body)['avatar']));
    _bloc.dispatch(Refresh(profile: false));
  }

  void saveImage(BuildContext context) async {
    if (await pms.checkStorage(context) != true) {
      Navigator.pop(context);
      return;
    }

    File image = await screenshotController.capture(pixelRatio: 1.5);
    var result = await ImageGallerySaver.saveImage(image.readAsBytesSync());

    Navigator.pop(context);
    
    if (result != null) {
      info(context, '保存成功');
    } else {
      info(context, '保存失败, 请重试');
    }
  }

  CupertinoActionSheet bottomSheet(BuildContext context) => CupertinoActionSheet(
    actions: [
      CupertinoActionSheetAction(
        child: Text('更换'),
        onPressed: () => pickImage(context),
      ),
      CupertinoActionSheetAction(
        child: Text('保存'),
        onPressed: () => saveImage(context),
      ),
    ],
    cancelButton: CupertinoActionSheetAction(
      child: Text('取消'),
      onPressed: () => Navigator.pop(context),
    )
  );


  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => CtNoRipple(
        icon: Icons.more_horiz,
        color: Colors.white,
        onTap: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => bottomSheet(context),
          );
        },
      )
    );
  }
}
