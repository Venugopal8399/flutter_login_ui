import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
            elevation: 0,
          title: Padding(
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.25,),
            child: const Text('SET',style: TextStyle(
              fontSize: 48, color: Colors.black,
              fontFamily: 'NEW YORK',
            ),),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu,color: Colors.black,),
                onPressed: () { Scaffold.of(context).openDrawer(); },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
