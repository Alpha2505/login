
import 'package:flutter/material.dart';
import 'package:login_ui/common/theme_helper.dart';
import 'package:login_ui/model/stationModel.dart';
import 'package:login_ui/pages/widgets/slot.dart';

class Stationdetail extends StatelessWidget {
  final StationModel stationModel;
  const Stationdetail({key, this.stationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(stationModel.name),
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
      body: Column(
        children: [
          Image.network(stationModel.ImageUrl),
          Text(stationModel.id),
          Text(stationModel.desc),
          Text(stationModel.contact),
          SizedBox(height: 90),
          Container(
            decoration: ThemeHelper().buttonBoxDecoration(context),
            child: ElevatedButton(
              style: ThemeHelper().buttonStyle(),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => slot()),
                        (route) => false);
              }, //after login redirect to homepage
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text('Book Slot'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
