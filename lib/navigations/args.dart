class RootArgs {
  final int index;
  final bool fetch;
  RootArgs({ this.index, this.fetch });
}

class ProfileArgs {
  final bool raw;
  ProfileArgs({ this.raw });
}

class ArticleArgs {
  final bool edit;
  final String id;
  final String type;
  final String mail;
  final String avatar;
  final String author;
  final String document;
  final String community;
  final int timestamp;

  ArticleArgs({
      this.id,
      this.mail,
      this.edit,
      this.type,
      this.avatar,
      this.author,
      this.document,
      this.community,
      this.timestamp
  });
}

class ModifyArgs {
  final String index;
  final String title;
  ModifyArgs({ this.index, this.title });
}

class NameArgs {
  final String id;
  final String name;
  final bool community;
  NameArgs({ this.name, this.id = '', this.community = false });
}

class CustomAvatarArgs {
  final bool rect;
  final String url;
  final String tag;
  final List<String> baks;
  CustomAvatarArgs({ this.url, this.tag, this.baks, this.rect });
}

enum QrType {
  community,
  join
}

class QrCodeArgs {
  final String code;
  final String name;
  final QrType type;

  QrCodeArgs({
      this.code,
      this.name,
      this.type,
  });
}
