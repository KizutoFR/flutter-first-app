import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _textcolor = Colors.black;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      if(_counter > 20){
        _textcolor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: CustomScrollView(
      slivers: <Widget>[    // partie d'une zone de défilement (scroll) qui peut être personnalisé
        SliverList( //affichage en liste verticale
          delegate: SliverChildBuilderDelegate( //  boucle x fois le constructeur
            (BuildContext context, int index) { // constructeur = créer des objets a partir d'une class
              return SizedBox ( // boite ou l'on peut changer la taille comme on veut
                width: 300,
                height: 400,
                child: Card (   //widget card (peut contenir qu'un child)
                  margin: const EdgeInsets.all(10), //espace entre les cards
                  color: Colors.white, // couleur de la carte
                  elevation: 10, //pronfondeur du survol
                  child: Column(  //widget Colum (peut contenir plusieurs children)
                    mainAxisSize: MainAxisSize.min, //la colonne se rétrécit pour s'adapter (fit) aux children
                    children: <Widget>[ // tableau de widget
                      Image.network("https://www.citationbonheur.fr/wp-content/uploads/2018/09/L_influence_du_paysage_sur_le_bonheur.jpg"), // affiche une image avce url (peut contenir plusieur option tel que width, height, opacity, box-fit ..)
                      const ListTile( // une class qui contient généralement 1 à 3 ligne de texte ainsi qu'une icône de début ou de fin.
                        leading: Icon (
                            Icons.album,  // Icone prit dans la librairie flutter (Icons)
                            color: Colors.cyan,
                            size: 45
                        ),
                        title: Text(
                          "Let's Talk About Love",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text('Modern Talking Album'),
                      ),
                    ],
                  ),
                ),
              );

            },
            childCount: 50,
          ),
        ),
        
      ],
    ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
