import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late SharedPreferences prefs;
  String name = "";
  TextEditingController _controller= TextEditingController();


  //save
  //
  void Save() async{
    prefs = await SharedPreferences.getInstance();
    prefs.setString("text",_controller.text.toString());
  }

  //retrive

  void retrieve() async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('text')!;
    });
  }

  //delete

  void  delete() async{
    prefs = await SharedPreferences.getInstance();
    prefs.remove("text");
    name = "";
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        //elevation:2,
        backgroundColor: Colors.red,
        title: Text("shared preferance",style: TextStyle(color: Colors.white),),
      ),

      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "enter your name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(name,style: TextStyle(fontSize: 30,color: Colors.red),),

            Container(
                height: 45,
                width: 180,
                child: ElevatedButton(onPressed: () {

                  Save();
                },

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black
                    ),
                    child: Text("save",style: TextStyle(color: Colors.white),))),
            SizedBox(
              height: 20,
            ),

            Container(
                height: 45,
                width: 180,
                child: ElevatedButton(onPressed: () {

                  retrieve();
                },

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black
                    ),
                    child: Text("retrieve",style: TextStyle(color: Colors.white),))),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 45,
                width: 180,
                child: ElevatedButton(onPressed: () {
                  delete();
                },

                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black
                    ),
                    child: Text("delete",style: TextStyle(color: Colors.white),))),

          ],
        ),
      ),


    );
  }
// Save() async{
//   prefs = await SharedPreferences.getInstance();
//   prefs.setString("text",_controller.text.toString());
// }

// retrieve() async{
//   prefs = await SharedPreferences.getInstance();
//   setState(() {
//     name = prefs.getString('text')!;
//   });
// }


// delete() async{
//   prefs = await SharedPreferences.getInstance();
//   prefs.remove("text");
//   name = "";
//   setState(() {
//
//   });
// }


}


