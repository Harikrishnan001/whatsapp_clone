import 'package:flutter/material.dart';

import '../../components/custom_fab.dart';
import '../../screens/calls_screen/calls_screen.dart';
import '../../screens/chat_screen/chat_screen.dart';
import '../../screens/status_screen/status_screen.dart';

const _kCustomTabBarHeight = 55.0;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('WhatsApp'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: CustomTabBar(_tabController),
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: TabBarView(
          controller: _tabController,
          children: [
            ChatScreen(),
            StatusScreen(),
            CallsScreen(),
          ],
        ),
      ),
      floatingActionButton: _tabController.index % 2 == 0
          ? FloatingActionButton(
              child:
                  Icon(_tabController.index == 0 ? Icons.message : Icons.call),
              onPressed: () {
                print('Floating action pressed');
              },
            )
          : CustomFloatingActionButton(),
    );
  }
}

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController controller;
  const CustomTabBar(this.controller);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 40.0,
              height: _kCustomTabBarHeight,
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white70,
                ),
                onPressed: () {
                  print("Camera pressed!");
                  //TODO:camera
                },
              ),
            ),
            SizedBox(
              width: constraints.maxWidth - 40.0,
              height: _kCustomTabBarHeight,
              child: TabBar(
                controller: controller,
                indicatorWeight: 2.5,
                indicatorColor: Colors.white,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: [
                  CustomTabWidget(
                    index: 0,
                    text: 'CHATS',
                    count: 55,
                    controller: controller,
                  ),
                  CustomTabWidget(
                    index: 1,
                    text: 'STATUS',
                    controller: controller,
                  ),
                  CustomTabWidget(
                    index: 2,
                    text: 'CALLS',
                    count: 2,
                    controller: controller,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(72.0);
}

class CustomTabWidget extends StatefulWidget {
  final int count;
  final int index;
  final String text;
  final TabController controller;

  const CustomTabWidget({
    required this.text,
    required this.index,
    required this.controller,
    this.count = 0,
    Key? key,
  }) : super(key: key);

  @override
  _CustomTabWidgetState createState() => _CustomTabWidgetState();
}

class _CustomTabWidgetState extends State<CustomTabWidget> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {
      setState(() {});
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.text,
            style: TextStyle(
                color: widget.controller.index == widget.index
                    ? Colors.white
                    : Colors.white.withOpacity(0.7)),
          ),
          widget.count > 0
              ? Container(
                  alignment: Alignment.center,
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    color: widget.controller.index == widget.index
                        ? Colors.white
                        : Colors.white.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "${widget.count > 999 ? (widget.count / 1000).round().toString() + "K" : widget.count}",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 11.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
