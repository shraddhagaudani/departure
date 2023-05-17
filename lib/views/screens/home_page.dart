import 'dart:convert';

import 'package:departure/controllers/providers/app_provider.dart';
import 'package:departure/models/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  String? data;

  List<Shlok_Model> shlokList = [];

  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  //
  Future<void> loadJSON() async {
    data = await rootBundle.loadString('assets/json/shlok.json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          0xff820000,
        ),
        foregroundColor: Colors.white,
        title: const Text(
          "ShikshaPatri",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 23,
          ),
        ),
        actions: [

          PopupMenuButton(
            initialValue: Provider.of<PopUpMenuButton_Provider>(context)
                .popUpMenuButton_Model
                .initialval,
            onSelected: (val) {
              Provider.of<PopUpMenuButton_Provider>(context)
                  .popUpMenuButton_Model
                  .initialval = val;
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Provider.of<ThemeAccess_Provider>(context,
                                  listen: false)
                              .ChangeTheme();
                          Navigator.of(context).pop();
                        },
                        icon: (Provider.of<ThemeAccess_Provider>(context,
                                        listen: false)
                                    .themeAccess_Model
                                    .isdark ==
                                false)
                            ? const Icon(
                                CupertinoIcons.moon,
                                color: Colors.black,
                              )
                            : const Icon(
                                CupertinoIcons.brightness,
                              ),
                      ),
                      const Text(
                        "Theme",
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: (shlokList.isEmpty)
            ? CupertinoButton(
                child: const Text("Click Here.."),
                onPressed: () {
                  List decodedList = jsonDecode(data!);

                  setState(
                    () {
                      shlokList = decodedList
                          .map(
                            (e) => Shlok_Model.fromMap(data: e),
                          )
                          .toList();
                    },
                  );
                },
              )
            : ListView.builder(
                itemCount: shlokList.length,
                itemBuilder: (context, i) {
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('Details_page', arguments: shlokList[i]);
                      },
                      leading: Text("${shlokList[i].shlokno}"),
                      title: Text(
                        "${shlokList[i].sanskrut}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
