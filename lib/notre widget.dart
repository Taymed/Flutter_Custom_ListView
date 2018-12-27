import 'package:flutter/material.dart';
// ce fichers contient la déclaration du template de nos éléments de liste
// this file containes the declaration of our basic list items


// chaque élément est un statefulWidget car il peut etre liké
// each item is a statefulwidget due to fact that it could be liked
class Elements extends StatefulWidget {
  // param <_sources> :notre Widget doit afficher une image à partir d'une source d'ou "_sources"
  // param <_sources> :our widget needs to display an image which needs a path to our assests and that's "_sources"
    String _sources ;
  // param <_titres> :il s'agit du titre de notre image "_titres"
  // param <_titres> :our widget needs to display the title of the image so that's the job of "_titres"
     String _titres ;
  // param <img_like> :il s'agit de la liste des images que nous avons liker
  // param <img_like> :is the list of all the images we liked
    Set<String>  img_like;
   
    Elements(this._sources,this._titres,this.img_like);
  _ElementsState createState() => _ElementsState(_sources,_titres,img_like);
}

class _ElementsState extends State<Elements> {
    String source ;
    String titre ;
    Set<String>  img_like;
 
   _ElementsState(this.source,this.titre,this.img_like);

  @override
  Widget build(BuildContext context) {
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
                      color: img_like.contains(titre) ? Colors.red : Colors.red[50],
                    ),
                  
                
               
              ),
            ],
          ),
        ),
      ),
       onTap: () {
                  
                  setState(() {
                   img_like.contains(titre)? img_like.remove(titre) : img_like.add(titre);
                  });
                },
    );
  }
  }
