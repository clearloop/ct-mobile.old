import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cdr_today/x/_style/text.dart';
import 'package:cdr_today/widgets/buttons.dart';

class ProtocolPage extends StatelessWidget {
  final bool login;
  ProtocolPage({ this.login = false });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        border: null,
        leading: Material(
          child: CtClose(),
          color: Colors.transparent
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              child: Text(
                'cdr.today 软件许可及服务协议', style: CtTextStyle.title2
              ),
              alignment: Alignment.center,
            ),
            SizedBox(height: 20.0),
            Align(
              child: Text('导言:\n', style: CtTextStyle.title3),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
                '欢迎你使用 cdr.today 软件及服务!\n\n为使用 cdr.today 软件及服务（以下简称“本软件”、“Ct 服务”或“本服务”），你应当阅读并遵守《cdr.today 软件许可及服务协议》（以下简称“本协议”）。 请你务必审慎阅读、充分理解各条款内容，特别是免除或限制责任的相应条款，以及开通或使用某项服务的单独协议，并选择接受或不接受。限制、免责条款可能以加粗形式提示你注意。 除非你已阅读并接受本协议所有条款，否则你无权下载、安装或使用本软件及相关服务。你的下载、安装、使用、登录等行为即视为你已阅读并同意上述协议的约束。 你有违反本协议的任何行为时，Ct 有权依照违反情况，随时单方限制、中止或终止向你提供本服务，并有权追究你的相关责任。 如果你未满18周岁，请在监护人的陪同下阅读本协议及其他上述协议，并特别注意未成年人使用条款。\n\n',
                style: CtTextStyle.callout
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('一、【协议的范围】:\n', style: CtTextStyle.title3),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
                '1.1 本协议是你与 Ct 之间关于你下载、安装、使用、复制本软件，以及使用 Ct 相关服务所订立的协议。\n\n1.2 本协议内容同时包括 Ct 可能不断发布的关于本服务的相关协议、服务声明、业务规则及公告指引等内容（以下统称为“专项规则”）。上述内容一经正式发布，即为本协议不可分割的组成部分，你同样应当遵守。\n\n',
                style: CtTextStyle.callout
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('二、【术语定义】:\n', style: CtTextStyle.title3),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
                '2.1 cdr.today 软件：是指 Ct 向用户提供的用于构建网络社区，发布想法等服务的客户端软件。你启用本软件后，可以创建社区，发布文章，在 Ct 中与朋友交流探讨想法等。\n\n2.2 Ct：是指上海旬空科技有限公司及其相关服务可能存在的运营关联单位。\n\n2.3 用户：是指启用、浏览或上传数据至 cdr.today 读书服务的用户，在本协议中更多地称为“你”。\n\n2.4 其他用户：是指除用户本人外与 cdr.today 服务相关的其他 cdr.today 用户。\n\n',
                style: CtTextStyle.callout
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('三、【关于本软件】:\n', style: CtTextStyle.title3),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
'3.1【服务许可】\n\n本软件可能提供多个应用版本，用户必须选择与所安装设备相匹配的软件版本。用户可根据本协议获得以下许可：\n\n3.1.1 Ct 给予你一项个人的、不可转让及非排他性的许可，以使用本软件。你可以为非商业目的在单一台终端设备上安装、使用、显示、运行本软件。\n\n3.1.2 你可以为使用本软件的目的复制本软件的一个副本，仅用作备份。备份副本必须包含原软件中含有的所有著作权信息。\n\n3.1.3 本条及本协议其他条款未明示授权的其他一切权利仍由 Ct 保留，你在行使这些权利时须另外取得 Ct 的书面许可。Ct 如果未行使前述任何权利，并不构成对该权利的放弃。\n\n\n3.2【安装与卸载】\n\n3.2.1 你可以直接从 Ct 的网站上获取本软件，也可以从得到 Ct 授权的第三方获取。如果你从未经 Ct 授权的第三方获取本软件或与本软件名称相同的安装程序，Ct 无法保证本软件能够正常使用，并对因此给你造成的损失不予负责。\n\n3.2.2 Ct 可能为不同的终端设备开发了不同的软件版本，你应当根据实际情况选择下载合适的版本进行安装。下载安装程序后，你需要按照该程序提示的步骤正确安装。为提供更加优质、安全的服务，在本软件安装时 Ct 可能推荐你安装其他软件，你可以选择安装或不安装。\n\n3.2.3 如果你不再需要使用本软件或者需要安装新版软件，可以自行卸载。如果你愿意帮助 Ct 改进产品服务，请告知卸载的原因。\n\n3.2.4 为了改善用户体验、完善服务内容，Ct 将不断努力开发新的服务，并为你不时提供软件更新（这些更新可能会采取软件替换、修改、功能强化、版本升级等形式）。为了保证本软件安全性和功能的一致性，Ct 有权不经向你特别通知而对软件进行更新，或者对软件的部分功能效果进行改变或限制。本软件新版本发布后，旧版本的软件可能无法使用。Ct 不保证旧版本软件继续可用及相应的客户服务，请你随时核对并下载最新版本。\n\n',
                style: CtTextStyle.callout
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('四、【用户个人信息保护】:\n', style: CtTextStyle.title3),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
'4.1 保护用户个人信息是 Ct 的一项基本原则，Ct 将会采取合理的措施保护用户的个人信息。除法律法规规定或本协议另有约定的情形外，未经用户许可 Ct 不会向第三方公开、透露用户个人信息。Ct 对相关信息采用专业加密存储与传输方式，保障用户个人信息的安全。\n\n4.2 你使用本服务的部分功能前需要有一个邮箱。用户有责任妥善保管你的邮箱帐户信息及帐户密码的安全，因你自身的原因导致邮箱帐户及密码泄漏，而造成的本服务下相关信息的泄露、篡改、删除等后果，Ct 不承担任何责任。\n\n4.3 Ct 将运用各种安全技术和程序建立完善的管理制度来保护你的个人信息，以免遭受未经授权的访问、使用或披露。\n\n4.4 未经你的同意，Ct 不会向 Ct 外的任何公司、组织和个人披露你的个人信息。\n\n',
                style: CtTextStyle.callout
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('五、【用户注意事项】:\n', style: CtTextStyle.title3),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
'5.1你理解并同意：为了向你提供有效的服务，本软件会利用你设备终端的处理器和带宽等资源。本软件使用过程中可能产生数据流量的费用，用户需自行向运营商了解相关资费信息，并自行承担相关费用。\n\n5.2 你在使用本软件某一特定服务时，该服务可能会另有单独的协议、专项规则等，你在使用该项服务前请阅读并同意相关的单独协议、专项规则。\n\n5.3 你理解并同意 Ct 将会尽其商业上的合理努力保障你在本软件中的数据存储安全，但是，C 并不能就此提供完全保证，包括但不限于以下情形：\n\n5.3.1 Ct 不对你在本软件中相关数据的删除或储存失败负责；\n\n5.3.2 Ct 有权根据实际情况自行决定单个用户在本软件中数据的最长储存期限，并在服务器上为其分配数据最大存储空间等；\n\n5.3.3 如果你停止使用本软件或服务被终止或取消，Ct 可以从服务器上永久地删除你的数据。服务停止、终止或取消后，Ct 没有义务向你返还任何数据。\n\n5.4 用户在使用本软件时，须自行承担如下来自Ct不可掌控的风险内容，包括但不限于：\n\n5.4.1 由于信息网络设备维护、连接故障，系统故障，电力故障，罢工，暴乱，火灾，洪水，风暴，爆炸，战争，政府行为，司法行政机关的命令或因第三方因素可能引起的个人信息丢失、泄漏及其他损害等风险；\n\n5.4.2 如使用本客户端软件，用户必须选择与所安装设备相匹配的软件版本，否则，由于软件与设备型号不相匹配所导致的任何问题或损害，均由用户自行承担；\n\n5.4.3 用户发布的内容或你的软件使用信息（包括但不限于使用本服务所产生的你的文章、想法等信息）被他人转发、分享，因此等传播可能带来的风险和责任；\n\n5.4.4由于网络信号不稳定、网络带宽小等原因，所引起的本软件登录失败、资料同步不完整、页面打开速度慢等风险。\n\n5.5你理解并同意，本服务默认生成软件使用信息（包括但不限于你的文章、你的想法讨论等信息，你及其他用户将有权浏览对方因使用本服务所生成的软件使用信息，前述软件使用信息不属于个人隐私或不能公开的个人信息。\n\n',
                style: CtTextStyle.callout
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('六、【用户行为规范】:\n', style: CtTextStyle.title3),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
'6.1 【服务使用规范】\n\n6.1.1 你应遵守本协议使用本服务。你理解并同意，本服务是你与其他用户之间的想法交流的平台，Ct 不鼓励你在未经其他用户允许的前提下将其他用户使用本服务所产生的软件使用信息对外转发、分享、传播或用作其他违法或不合理用途。\n\n6.2 【信息内容规范】\n\n6.2.1 本条所述信息内容是指用户使用本服务过程中所制作、复制、发布、传播的任何内容，包括但不限于图片、文字、相关链接页面等使用本服务所产生的内容。\n\n6.2.2 你理解并同意，Ct 一直致力于为用户提供文明健康、规范有序的网络环境，你不得利用本服务制作、复制、发布、传播如下干扰本服务正常运营，以及侵犯其他用户或第三方合法权益的内容，包括但不限于：\n\n6.2.2.1 发布、传送、传播、储存违反国家法律法规禁止的内容：\n（1）违反宪法确定的基本原则的；\n（2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；\n（3）损害国家荣誉和利益的；\n（4）煽动民族仇恨、民族歧视，破坏民族团结的；\n（5）破坏国家宗教政策，宣扬邪教和封建迷信的；\n（6）散布谣言，扰乱社会秩序，破坏社会稳定的；\n（7）散布淫秽、色情、赌博、暴力、恐怖或者教唆犯罪的；\n（8）侮辱或者诽谤他人，侵害他人合法权益的；\n（9）煽动非法集会、结社、游行、示威、聚众扰乱社会秩序；\n（10）以非法民间组织名义活动的；\n（11）含有法律、行政法规禁止的其他内容的。\n\n6.2.2.2 发布、传送、传播、储存侵害他人名誉权、肖像权、知识产权、商业秘密等合法权利的内容；\n\n6.2.2.3 未经他人许可发布、传送、传播涉及他人隐私、个人信息或资料的内容，但因使用本服务所默认生成并公布的软件使用信息除外；\n\n6.2.2.4 发表、传送、传播骚扰、广告信息及垃圾信息或含有任何性或性暗示的；\n\n6.2.2.5 其他违反法律法规、政策及公序良俗、社会公德或干扰本服务正常运营和侵犯其他用户或第三方合法权益内容的信息。\n\n6.3【运营规范】\n\n你使用本服务过程中不得从事下列行为：\n\n6.3.1 提交、发布虚假信息，或冒充、利用他人名义的；\n\n6.3.2 诱导其他用户点击链接页面或分享信息的；\n\n6.3.3 虚构事实、隐瞒真相以误导、欺骗他人的；\n\n6.3.4 侵害他人名誉权、肖像权、知识产权、商业秘密等合法权利的；\n\n6.3.5 未经Ct书面许可利用邮箱帐号和任何服务，以及第三方运营平台进行推广或互相推广的；\n\n6.3.6 利用本软件及服务从事任何违法犯罪活动的；\n\n6.3.7 制作、发布与以上行为相关的方法、工具，或对此类方法、工具进行运营或传播，无论这些行为是否为商业目的；\n\n6.3.8 其他违反法律法规规定、侵犯其他用户合法权益、干扰产品正常运营或Ct未明示授权的行为。\n\n6.4【对自己行为负责】\n\n你充分了解并同意，你必须为自己注册帐号下的一切行为负责，包括你所发表的任何内容以及由此产生的任何后果。你应对本服务中的内容自行加以判断，并承担因使用内容而引起的所有风险，包括因对内容的正确性、完整性或实用性的依赖而产生的风险；同时，你应在本协议约定的范围内使用本服务，因你利用本服务进行违反法律法规、本协议、专项规则的行为所产生的风险亦由你自行承担。Ct无法且不会对因前述风险而导致的任何损失或损害承担责任。\n\n',
                style: CtTextStyle.callout
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('七、【管理规范】:\n', style: CtTextStyle.title3),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
'7.1 Ct 有权根据国家相关法规政策，按照本协议的规定，对你发布、传送、传播、储存的内容进行审查，以保证用户使用本服务的行为不违反法律法规及社会公共道德准则、不侵犯 Ct 或第三方的合法权益、不带有诋毁 Ct 及其产品形象的要素。但并不因为 Ct 的审核而减轻你自身使用本服务时应承担的责任，由此产生的一切责任和后果仍由你单独承担。\n\n7.2 如果 Ct 发现或收到他人举报或投诉用户违反本协议约定的，Ct 有权不经通知随时对相关内容进行删除、屏蔽，并视行为情节对违规帐号处以包括但不限于警告、限制或禁止使用部分或全部服务、帐号封禁直至注销的处罚，并公告处理结果。\n\n7.3 你理解并同意，Ct 有权依合理判断对违反有关法律法规或本协议规定的行为进行处罚，对违法违规的任何用户采取适当的法律行动，并依据法律法规保存有关信息向有关部门报告等，用户应独自承担由此而产生的一切法律责任。\n\n7.4 你理解并同意，因你违反本协议或相关服务条款的规定，导致或产生第三方主张的任何索赔、要求或损失，你应当独立承担责任；Ct 因此遭受损失的，你也应当一并赔偿。\n\n',
                style: CtTextStyle.callout
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('八、【知识产权声明】:\n', style: CtTextStyle.title3),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
'8.1 Ct 是本软件的知识产权权利人。本软件的一切著作权、商标权、专利权、商业秘密等知识产权，以及与本软件相关的所有信息内容（包括但不限于文字、图片、音频、视频、图表、界面设计、版面框架、有关数据或电子文档等）均受中华人民共和国法律法规和相应的国际条约保护，Ct 享有上述知识产权，但相关权利人依照法律规定应享有的权利除外。\n\n8.2 未经 Ct 或相关权利人书面同意，你不得为任何商业或非商业目的自行或许可任何第三方实施、利用、转让上述知识产权。\n\n',
                style: CtTextStyle.callout
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('九、【终端安全责任】:\n', style: CtTextStyle.title3),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
'9.1 你理解并同意，本软件同大多数互联网软件一样，可能会受多种因素影响，包括但不限于用户原因、网络服务质量、社会环境等；也可能会受各种安全问题的侵扰，包括但不限于他人非法利用用户资料，进行现实中的骚扰；用户下载安装的其他软件或访问的其他网站中可能含有病毒、木马程序或其他恶意程序，威胁你的终端设备信息和数据安全，继而影响本软件的正常使用等。因此，你应加强信息安全及个人信息的保护意识，注意密码保护，以免遭受损失。\n\n9.2 你不得制作、发布、使用、传播用于窃取邮箱帐号及他人个人信息、财产的恶意程序。\n\n9.3 维护软件安全与正常使用是 Ct 和你的共同责任，Ct 将按照行业标准合理审慎地采取必要技术措施保护你的终端设备信息和数据安全，但是你承认和同意 Ct 并不能就此提供完全保证。\n\n9.4 在任何情况下，你不应轻信借款、索要密码或其他涉及财产的网络信息。涉及财产操作的，请一定先核实对方身份，并请经常留意 Ct 有关防范诈骗犯罪的提示。\n\n',
                style: CtTextStyle.callout
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('十、【未成年人保护】:\n', style: CtTextStyle.title3),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
'Ct 非常重视对未成年人个人信息的保护。若你是18周岁以下的未成年人，在使用 Ct 的服务前，应事先取得你监护人的书面同意。\n\n',
                style: CtTextStyle.callout
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('十一、【其他】:\n', style: CtTextStyle.title3),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text(
'11.1 你使用本软件即视为你已阅读并同意受本协议的约束。Ct 有权在必要时修改本协议条款。你可以在本软件的最新版本中查阅相关协议条款。本协议条款变更后，如果你继续使用本软件，即视为你已接受修改后的协议。如果你不接受修改后的协议，应当停止使用本软件。\n\n11.2 若你和 Ct 之间发生任何纠纷或争议，首先应友好协商解决；协商不成的，你同意将纠纷或争议提交本协议签订地有管辖权的人民法院管辖。\n\n11.5 本协议所有条款的标题仅为阅读方便，本身并无实际涵义，不能作为本协议涵义解释的依据。\n\n11.6 本协议条款无论因何种原因部分无效或不可执行，其余条款仍有效，对双方具有约束力。（正文完）\n\n',
                style: CtTextStyle.callout
              ),
              alignment: Alignment.centerLeft,
            ),
            Align(
              child: Text('cdr.tody\n\n', style: CtTextStyle.body),
              alignment: Alignment.centerRight,
            ),
            // Divider(),
            // Padding(
            //   child: CupertinoButton.filled(
            //     child: Text('同意'),
            //     onPressed: () {
            //       Navigator.of(context).pushReplacementNamed('/login');
            //     }
            //   ),
            //   padding: EdgeInsets.only(top: 35.0, bottom: 20.0),
            // ),
            SafeArea(child: SizedBox(height: 20.0)),
          ]
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.0)
      )
    );
  }
}
