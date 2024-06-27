import 'package:flutter/material.dart';
// import 'package:kajian_sunah_sbx3/config/constants.dart';

import '../../widget/tab_view.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bookmark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> tabList = [
      const Tab(
        text: 'Agenda',
      ),
      const Tab(
        text: 'Artikel',
      ),
      const Tab(
        text: 'Pengumuman',
      )
    ];
    List<Widget> tabContentList = [
      const BookmarkTabView(
        category: 'Agenda',
      ),
      const BookmarkTabView(
        category: 'Artikel',
      ),
      const BookmarkTabView(
        category: 'Pengumuman',
      )
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Center(
        child: MyTabView(
          tabList: tabList,
          tabContentList: tabContentList,
          // labelColor: kPrimaryColor,
          // indicatorColor: kPrimaryColor,
        ),
      ),
    );
  }
}

class BookmarkTabView extends StatelessWidget {
  final String category;
  const BookmarkTabView({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$category Bookmark'),
    );
  }
}
