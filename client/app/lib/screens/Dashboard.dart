import 'package:app/data/travelapi.dart';
import 'package:app/model/travelModel.dart';
import 'package:app/widgets/Scrollitems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<TravelModel> travel = [];
  bool _loading = true;
  TravelProcess travelProcess = TravelProcess();

  getPlaces() async {
    travel = await travelProcess.getPlaces();
    print(travel);
    setState(() {
      _loading = false;
    });
  }

  _updateStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
    );
  }

  @override
  void initState() {
    getPlaces();
    _updateStatusBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.person_outline,
              color: Colors.black,
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore the Wonders...",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 25,
                  letterSpacing: 0.7,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
              "The New 7 Wonders of the World.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30),
            CupertinoSearchTextField(),
            SizedBox(height: 30),
            _loading
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(150.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Container(
                    height: 550,
                    width: 500,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: travel.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Scrollitems(
                              mainImage: travel[index].imageUrl[1],
                              place: travel[index].place,
                              country: travel[index].country,
                              description: travel[index].description,
                              images: travel[index].imageUrl),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
