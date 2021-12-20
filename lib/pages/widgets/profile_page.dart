import 'package:flutter/material.dart';
import 'package:login_ui/pages/widgets/pass.dart';
import 'package:login_ui/pages/widgets/pin.dart';
import 'package:login_ui/pages/widgets/prof.dart';

class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text('My Profile'),
        toolbarHeight: 75,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
                colors: [Colors.teal.shade400, Colors.grey],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container( //this is login form
                padding: EdgeInsets.fromLTRB(25, 50, 25, 10),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(

                  children: [
                    SizedBox(height: 30.0),
                    Text(
                      'Username',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0,
                        horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Prof())),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  )
              ),
                    ),

                    SizedBox(height: 30.0),
                    Text(
                      'Email ID',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0,
                              horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                          ),

                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          )
                      ),
                    ),

                    SizedBox(height: 30.0),
                    Text(
                      'Mobile No.',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0,
                              horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                          ),

                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          )
                      ),
                    ),

                    SizedBox(height: 30.0),
                    Text(
                      'PIN Code',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0,
                              horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                          ),
                          suffixIcon: InkWell(
                            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => pin())),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          )
                      ),
                    ),

                    SizedBox(height: 30.0),
                    Text(
                      'Password',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0,
                              horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                          ),
                          suffixIcon: InkWell(
                            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => pass())),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          )
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
