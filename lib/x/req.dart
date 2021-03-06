import 'dart:convert';
import 'package:cdr_today/x/conf.dart';
import 'package:cdr_today/x/store.dart';
import 'package:http/http.dart' as http;

const Response = http.Response;
final http.Response timeout = http.Response('timeout', 408);

networkAdaptor() async {
  var res;
  while (res == null || res.statusCode != 200) {
    for (var i in conf['base']) {
      res = await http.get(i).timeout(
        Duration(seconds: 3), onTimeout: () => timeout,
      ).catchError((e) => timeout);
      
      if (res.statusCode == 200) {
        setString('base', i);
        return;
      }
    }
  }
}

class Requests {
  String base, code, mail;
  Map<String, String> headers;

  // init
  static Future<Requests> init() async {
    String base = await getString('base');
    String code = await getString('code');
    String mail = await getString('mail');
    Map<String, String> headers = {'code': code};
    
    
    return Requests(
      base: base,
      code: code,
      mail: mail,
      headers: headers
    );
  }
  
  Requests({this.base, this.mail, this.code, this.headers});
  
  // methods
  Future<http.Response> rGet(String url) {
    return http.get("$base$url", headers: headers).timeout(
      Duration(seconds: 5), onTimeout: () => timeout,
    ).catchError((e) => timeout);
  }

  Future<http.Response> rPut(String url, {Map body}) {
    return http.put("$base$url", headers: headers, body: json.encode(body)).timeout(
      Duration(seconds: 5), onTimeout: () => timeout,
    ).catchError((e) => timeout);
  }
  
  Future<http.Response> rPost(String url, {Map body}) {
    return http.post("$base$url", headers: headers, body: json.encode(body)).timeout(
      Duration(seconds: 5), onTimeout: () => timeout,
    ).catchError((e) => timeout);
  }

  Future<http.Response> rDelete(String url) {
    return http.delete("$base$url", headers: headers).timeout(
      Duration(seconds: 5), onTimeout: () => timeout,
    ).catchError((e) => timeout);
  }


  Future<http.Response> hw() async {
    return await rGet("/");
  }
  
  /* routes */
  //@auth: GET '/a/{mail:string}'
  Future<http.Response> auth({String mail}) async {
    return await rGet("/u/$mail");
  }

  //@authVerify: POST '/a/{mail:string}'
  Future<http.Response> authVerify({String mail, String code}) async {
    final Map body = { 'code': code };
    var res = await rPost("/u/$mail", body: body);
    if (res.statusCode == 200) {
      setString('mail', mail);
      setString('code', code);
    }
    return res;
  }  
  
  /// --- reddit ---
  //@newReddit: POST '/u/{mail:string}/reddit'
  Future<http.Response> newReddit({
      String type, String topic, String community, String document
  }) async {
    final Map body = {
      'type': type,
      'topic': topic,
      'document': document,
      'community': community,
    };
    return await rPost("/u/$mail/reddit", body: body);
  }

  //@getPosts: GET '/u/:mail/c/:id/reddit'
  Future<http.Response> getReddits({String community, int page, int limit}) async {
    var res = await rGet("/u/$mail/c/$community/reddit?p=$page&l=$limit");
    if (res.statusCode == 408) return getReddits(community: community, page: page, limit: limit);
    return res;
  }
  
  //@updatePost: PUT '/u/:mail/r/:id'
  Future<http.Response> updateReddit({
      String id, String document,
  }) async {
    final Map body = {
      'document': document,
    };
    return await rPut("/u/$mail/r/$id", body: body);
  }

  //@updatePost: POST '/u/:mail/r/:id/time'
  Future<http.Response> updateRedditTime({
      String id
  }) async {
    return await rPost("/u/$mail/r/$id/time");
  }

  //@deletePost: DELETE '/u/:mail/p/delete'
  Future<http.Response> deleteReddit({ String id }) async {
    return await rDelete("/u/$mail/r/$id");
  }

  /// --- community ---
  //@getMembers GET '/u/{mail:string}/c'
  Future<http.Response> getCommunities() async {
    var res = await rGet("/u/$mail/c");
    if (res.statusCode == 408) return getCommunities();
    return res;
  }

  //@getMembers GET '/u/{mail:string}/c/:id/topics'
  Future<http.Response> getTopics(String id) async {
    var res = await rGet("/u/$mail/c/$id/topics");
    if (res.statusCode == 408) return getTopics(id);
    return res;
  }

  //@getMembers GET '/u/{mail:string}/c/:id/topics/:topic'
  Future<http.Response> getTopicBatch(String community, String topic) async {
    var res = await rGet("/u/$mail/c/$community/topic/$topic");
    if (res.statusCode == 408) return getTopicBatch(community, topic);
    return res;
  }

  //@getMembers GET '/u/{mail:string}/{id:string}/members'
  Future<http.Response> getMembers({String id}) async {
    var res = await rGet("/u/$mail/c/$id/members");
    if (res.statusCode == 408) return getMembers(id: id);
    return res;
  }

  //@getMembers GET '/u/{mail:string}/{id:string}/members'
  Future<http.Response> quitCommunity({String id}) async {
    return await rGet("/u/$mail/c/$id/quit");
  }

  //@createCommunity POST '/u/{mail:string}/c/create'
  Future<http.Response> createCommunity({String name}) async {
    final Map body = {
      'name': name
    };
    return await rPost("/u/$mail/c/create", body: body);
  }

  //@joinCommunity POST '/u/{mail:string}/c/join'
  Future<http.Response> joinCommunity({String id}) async {
    final Map body = {
      'id': id,
    };
    return await rPost("/u/$mail/c/join", body: body);
  }

  //@updateCommunityName: PUT '/u/{mail:string}/c/name'
  Future<http.Response> updateCommunityName({String name, String id}) async {
    final Map body = {
      'name': name,
      'id': id
    };
    return await rPut("/u/$mail/c/name", body: body);
  }

  //@updateCommunityId: PUT '/u/{mail:string}/c/id'
  // Future<http.Response> updateCommunityId({String idTarget, String id}) async {
  //   final Map body = {
  //     'id': id,
  //     'idTarget': idTarget
  //   };
  //   return await rPut("/u/$mail/c/id", body: body);
  // }

  /// --- author ----
  //@getPosts: GET '/a/{mail:string}/post'
  Future<http.Response> getAuthorPost({int page, String mail}) async {
    return await rGet("/u/$mail/post?p=$page");
  }
  
  /// --- account ---
  //@updateName: PUT '/u/{mail:string}/i/name'
  Future<http.Response> updateName({String name}) async {
    final Map body = {
      'name': name
    };
    return await rPut("/u/$mail/i/name", body: body);
  }

  //@updateName: PUT '/u/{mail:string}/i/avatar'
  Future<http.Response> updateAvatar({String avatar}) async {
    final Map body = {
      'avatar': avatar,
    };
    return await rPut("/u/$mail/i/avatar", body: body);
  }

  /// --- post ---
  //@getPosts: GET '/u/:mail/post'
  Future<http.Response> getPosts({
      String ident, String community, int page, int limit
  }) async {
    var res = await rGet("/u/$mail/post/$ident?c=$community&p=$page&l=$limit");
    if (res.statusCode == 408) return getPosts(
      ident: ident, community: community, page: page, limit: limit
    );
    return res;
  }
  
  //@newPost: POST '/u/{mail:string}/p'
  Future<http.Response> newPost({String document}) async {
    final Map body = {
      'document': document,
    };
    return await rPost("/u/$mail/post", body: body);
  }

  //@getPosts: GET '/u/{mail:string}/post'
  Future<http.Response> getPost({int page}) async {
    return await rGet("/u/$mail/post?p=$page");
  }
  
  //@updatePost: PUT '/u/{mail:string}/p/update'
  Future<http.Response> updatePost({ String id, String document }) async {
    final Map body = {
      'document': document,
    };
    return await rPut("/u/$mail/post/$id", body: body);
  }

  //@deletePost: DELETE '/u/{mail:string}/p/delete'
  Future<http.Response> deletePost({ String id }) async {
    return await rDelete("/u/$mail/post/$id");
  }

  /// --- image ---
  //@upload: POST '/u/{mail:string}/upload'
  Future<http.Response> upload({ String image }) async {
    final Map body = {
      'image': image
    };
    return await rPost("/u/$mail/upload", body: body);
  }

  /// --- report ---

  //@report: POST '/u/{mail:string}/report'
  Future<http.Response> report({ String type, String task, String content}) async {
    final Map body = {
      'type': type,
      'task': task,
      'content': content,
    };
    return await rPost("/u/$mail/report", body: body);
  }
}
