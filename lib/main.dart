import 'package:flutter/material.dart';
import 'notre widget.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Liste massi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    static List<String> titre = [
    "Iceland",
    "Forest",
    "atlantic ocean",
    "Iceland road",
    "San Fransisco",
    "Lac",
    "Iceland Mountain",
    "Mountain",
    "Washington bay"
  ];

  static List<String> source = [
    "ressources/a.jpg",
    "ressources/b.jpg",
    "ressources/c.jpg",
    "ressources/d.jpg",
    "ressources/e.jpg",
    "ressources/f.jpg",
    "ressources/g.jpg",
    "ressources/h.jpg",
    "ressources/i.jpg"
  ]; 
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Listes simple"),
        actions: <Widget>[
          IconButton(
            icon: new Icon(
              Icons.list,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {print("on m'as clické dessus");},
          ),
        ],
      ),
      body: Center(
        child: MaListe(source ,titre),
      ),
    );
  }
}

class MaListe extends StatefulWidget {
  List<String> _sources;
  List<String> _titres ;
  MaListe(this._sources,this._titres);
  _MaListeState createState() => _MaListeState(_sources,_titres);
}

class _MaListeState extends State<MaListe> {
    final List<String>_sources ;
    final List<String>_titres ;
    Set<String> _img_like = new Set<String>();
  
  _MaListeState(this._sources,this._titres);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: new EdgeInsets.all(20.0),
        itemCount:2 * _sources.length - 1,
        itemBuilder: (context, i) {
             if(i.isOdd){
               return new Divider(
                color: Colors.black,
              );}
              final ind = i~/2; 
             return  Elements(_sources[ind] , _titres[ind] , _img_like );
            
        });
  }

 /* Widget element(String source , String titre) {
    final bool enrgt = _img_like.contains(titre);

    return InkWell(
          highlightColor: Colors.blue,
          splashColor: Colors.blue,
          
          child: Container(
        child: Container(
                    padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                new BoxShadow(color: Colors.grey, blurRadius: 10.0),
              ],
              color: Colors.grey[200],
            ),
          child: Column(
            children: <Widget>[
              Container(
                  width: 360.0,
                  height: 300.0,
                  padding: EdgeInsets.all(2.0),
                  child: new Container(
                    padding: EdgeInsets.all(2.0),
                    child: Image.asset(
                     source,
                      height: 300,
                      width: 300,
                    ),
                  ),
                )
              ,ListTile(
                
                title: Text(titre,
                style: TextStyle(
                  fontSize: 18.5,
                  
                ),),
                subtitle: Text("oh la belle image "),
                trailing:
                    
                    new Icon(
                      Icons.favorite,
                      color: _img_like.contains(titre) ? Colors.red : Colors.red[50],
                    ),
                  
                
               
              ),
            ],
          ),
        ),
      ),
       onTap: () {
                  
                  setState(() {
                    enrgt ? _img_like.remove(titre) : _img_like.add(titre);
                  });
                },
    );
}*/
}
