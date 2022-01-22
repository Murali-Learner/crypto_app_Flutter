// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/models/apiModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'dart:io' show Platform;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<String> errorStrings = [
    //   "Basic Attention Token",
    // ];
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    bool isSwitched = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cryptocurrency ",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Platform.isAndroid
              ? Container()
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: _height * 0.8,
              width: _width,
              // color: Colors.amber,
              child: Consumer<List<CoinApiModel>>(
                builder: (context, value, child) {
                  if (value.isEmpty) {
                    return const Text("Loading...");
                  } else {
                    return Container(
                      height: _height * 0.79,
                      // color: Colors.black45,
                      child: ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            height: _height * 0.2,
                            padding: EdgeInsets.only(bottom: _height * 0.03),
                            child: Card(
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CachedNetworkImage(
                                      height: 100,
                                      width: 100,
                                      imageUrl:
                                          value[index].image.split("?")[0],
                                      placeholder: (context, url) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                    SizedBox(
                                      width: _height * 0.03,
                                    ),
                                    SizedBox(
                                      height: _height * 0.17,
                                      width: _width * 0.3,
                                      // color: Colors.amber,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            value[index].symbol.toUpperCase(),
                                            style: GoogleFonts.lato(
                                                fontSize: 23,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: _height * 0.02,
                                          ),
                                          Text(
                                            value[index].name,
                                            style: GoogleFonts.lato(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600),
                                            overflow: TextOverflow.fade,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: _height * 0.04,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          value[index].low24H.toString(),
                                          style: GoogleFonts.roboto(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: _height * 0.03,
                                        ),
                                        Text(
                                          value[index].high24H.toString(),
                                          style: GoogleFonts.roboto(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            // Transform.scale(
            //     scale: 2,
            //     child: Switch(
            //       onChanged: (value) {},
            //       value: isSwitched,
            //       activeColor: Colors.blue,
            //       activeTrackColor: Colors.lightBlueAccent,
            //       inactiveThumbColor: Colors.redAccent,
            //       inactiveTrackColor: Colors.orange,
            //     )),
          ],
        ),
      ),
    );
  }
}
