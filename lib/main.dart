import 'package:app_demo/screen/view_note.dart';
import 'package:app_demo/screen/view_remind.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() { runApp(MyApp()); }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Running', theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MyHomePage(title: 'APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> notes=[];import 'package:flutter/material.dart';

  import 'edit_note.dart';

  void main() {
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
  primarySwatch: Colors.green,
  ),
  home: MyHomePage(title: 'Flutter Demo Home Page'),
  );
  }
  }

  class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {

  List<String> notes = [];
  List<String> reminders = ["reminder1", "reminder2", "rem3"];

  var selectedIndex=0;

  void createNewNote() async {

  String note = await Navigator.push(
  context, MaterialPageRoute(builder: (context) => EditNote()));

  setState(() {
  notes.add(note);
  });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text(widget.title),
  ),

  body: IndexedStack(

  index: selectedIndex,
  children:[
  buildListView(notes),
  buildListView(reminders),
  ],
  ),


  floatingActionButton: FloatingActionButton(
  onPressed: createNewNote,
  tooltip: 'Increment',
  child: Icon(Icons.add),
  ),

  bottomNavigationBar: BottomNavigationBar(

  currentIndex: selectedIndex,

  onTap: (value) {
  setState(() {
  selectedIndex = value;
  });
  },

  items: [
  BottomNavigationBarItem(
  icon: Icon(Icons.notes),
  label: "Notas"
  ),

  BottomNavigationBarItem(
  icon: Icon(Icons.calendar_today),
  label: "Recordatorio"
  ),

  ],),

  // This trailing comma makes auto-formatting nicer for build methods.
  );

  }

  ListView buildListView(List<String> notes)  {

  return ListView.builder(
  itemCount: notes.length,
  itemBuilder: (context, index) {

  return InkWell(
  child: Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text(notes[index]),
  ),


  onTap: () async {

  final note = await Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => EditNote(note: notes[index])));

  setState(() {
  notes[index] = note;
  });});},);}}

  List<String> reminds=[];

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(onPressed: CreateNewNote, icon: Icon(Icons.note_add)),
          IconButton(onPressed: CreateNewRemind, icon: Icon(Icons.calendar_today_outlined))
        ],
      ),
      drawer: _getDrawer(context),
      body: _getBody(context),
      );
  }

  Widget _getDrawer(BuildContext context){
    return Drawer(
        child: ListView(
            children: <Widget>[
              DrawerHeader(
                 decoration: BoxDecoration(color: Colors.orange),
                 margin: const EdgeInsets.all(16.0),
                 child: Icon(Icons.queue_play_next_rounded, size: 100,)),
              ListTile(
                 leading: Icon(Icons.home, color: Colors.black, size: 20,),
                 title: Text("Inicio"),
                  onTap: (){Navigator.pop(context);}
              ),
              Divider(),
              ListTile(
                  leading: Icon(Icons.search_off, color: Colors.black, size: 20,),
                  title: Text("Buscar")
              ),
              Divider(),
              ListTile(
                  leading: Icon(Icons.note_add, color: Colors.black, size: 20,),
                  title: Text("Notas"),
                  onTap: CreateNewNote
              ),
              Divider(),
              ListTile(
                  leading: Icon(Icons.calendar_today_outlined, color: Colors.black, size: 20,),
                  title: Text("Recordatorios"),
                  onTap: CreateNewRemind
              ),
              Divider(),
    ]));
  }

  Widget _getBody(BuildContext context){
    return Container(color: Colors.black12,
        child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Registro de notas"))),
              Divider(),
              Expanded(child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index){
                  return ListTile(
                      leading: Icon(Icons.album_outlined, color: Colors.blue, size: 20,),
                      title: Text(notes[index]));
                },
              )),
              Divider(),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Registro de recordatorios"))),
              Divider(),
              Expanded(child: ListView.builder(
                itemCount: reminds.length,
                itemBuilder: (context, index){
                  return ListTile(
                      leading: Icon(Icons.album_outlined, color: Colors.orange, size: 20,),
                      title: Text(reminds[index]));
                },
              ))
            ])),
    );
  }
  void CreateNewNote() async{
    final noti = await Navigator.push(context, MaterialPageRoute(builder: (contex) => ViewNote()));
    setState(() {
      if(noti!=null){notes.add(noti.toString());}

    });
  }

  void CreateNewRemind() async{
    final remind = await Navigator.push(context, MaterialPageRoute(builder: (contex) => ViewRemind()));
    setState(() {
      if(remind!=null){reminds.add(remind.toString());}
    });
  }

}