import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/add_friend_menu.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

class FriendsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FriendsPageViewState();
}

/// Manages the 'about' section of the app.
class FriendsPageViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return ListView(
      key: Key('friends'),
      children: <Widget>[
        PageTitle(name: 'Amigos'),
        Container(
          margin: EdgeInsets.only(left: borderMargin, right: borderMargin),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor))),
          padding: EdgeInsets.only(bottom: 15),
        ),
        Expanded(child: addFriendMenu())
      ],
    );
  }
}
