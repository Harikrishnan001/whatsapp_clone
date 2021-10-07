class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: AppBar(
            elevation: 10,
            backgroundColor: Colors.green[900],
            title: Column(
              children: [
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: 170),
                        child: Text("WhatsApp")),
                    IconButton(icon: Icon(Icons.search), onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.settings_applications),
                        onPressed: () {})
                  ],
                ),
              ],
            ),
            // bottom: PreferredSizeWidget(child:row(MainAxisAlignment:MainAxisAlignment.spaceEvenly,children:)),
          ),
        ),
        body: Container(
          color: Colors.green[900],
          child: Row(children: [
            IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
            Container(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "CHATS",
                      style: TextStyle(color: Colors.white),
                    ))),
            Container(
              padding: EdgeInsets.only(right: 25, left: 25),
              child: TextButton(
                child: Text("STATUS", style: TextStyle(color: Colors.white)),
                onPressed: () {},
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25, right: 10),
              child: TextButton(
                child: Text("CALLS", style: TextStyle(color: Colors.white)),
                onPressed: () {},
              ),
            ),
          ]),
        ),
        floatingActionButton: Container(decoration:BoxDecoration(shape:BoxShape.circle ,color: Colors.green), child: IconButton(icon:Icon(Icons.message), onPressed:(){})),
      ),
    );
  }
}
