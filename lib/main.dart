
import 'package:flutter/material.dart';

void main () {
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner:true,
      home: Scaffold(
        backgroundColor: Colors.white, //set clr to backgrnd
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.green,// appbar er clr change
          centerTitle: true, // appbar er text centre er jnno command

          title:  Text("Home",style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          leading: Icon(Icons.add_business,color: Colors.white,size: 20,),
          actions: [Icon(Icons.search),],
          elevation: 70,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // edit with main axis
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("This is mod 5 Assignment",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("My ",
                      style: TextStyle(
                      color: Colors.pinkAccent,
                        fontSize: 20
                    ),),
                    Text("Phone ",style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 10
                    ),),
                    Text("name ",style: TextStyle(
                      color: Colors.purple,
                      fontSize: 14
                    ),),
                    Text("Samsung",style: TextStyle(
                      color: Colors.orange,
                      fontSize: 22
                    ),)
                  ],
                )
              ],
            )),
      ),
     // title: "Valley",
    );
  }
}
