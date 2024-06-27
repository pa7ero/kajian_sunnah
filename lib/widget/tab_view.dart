import 'package:flutter/material.dart';

class MyTabView extends StatefulWidget {
  final List<Widget> tabList;
  final List<Widget> tabContentList;
  final TabAlignment tabAlignment;

  final Color indicatorColor;
  final Color labelColor;
  final Color unselectedLabelColor;

  const MyTabView({
    super.key,
    required this.tabList,
    required this.tabContentList,
    this.tabAlignment = TabAlignment.center,
    this.indicatorColor = Colors.teal,
    this.labelColor = Colors.teal,
    this.unselectedLabelColor = Colors.black54,
  });
  @override
  _MyTabViewState createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> with TickerProviderStateMixin {
  late TabController _nestedTabController;
  @override
  void initState() {
    super.initState();
    _nestedTabController =
        TabController(length: widget.tabList.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TabBar(
            controller: _nestedTabController,
            indicatorColor: widget.indicatorColor,
            labelColor: widget.labelColor,
            unselectedLabelColor: widget.unselectedLabelColor,
            isScrollable: true,
            tabs: widget.tabList,
            tabAlignment: widget.tabAlignment,
          ),
          Expanded(
            child: Container(
                height: screenHeight * 1.0,
                margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TabBarView(
                    controller: _nestedTabController,
                    children: widget.tabContentList)),
          )
        ]);
  }
}
