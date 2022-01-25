// ignore_for_file: import_of_legacy_library_into_null_safe, unnecessary_brace_in_string_interps

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/models/apiModel.dart';
import 'package:crypto_app/widgets/alertDialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'dart:io' show Platform;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  pickdate(String parseDate) {
    final dateTime = DateTime.parse(parseDate);
    final format = DateFormat('yyyy-MM-dd HH:mm');
    final date = format.format(dateTime);
    return date;
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cryptocurrency",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
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
                    return Text(
                      "Loading...",
                      style: GoogleFonts.alef(fontSize: 30),
                    );
                  } else {
                    return SizedBox(
                      height: _height * 0.79,
                      child: ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                            onTap: () {
                              showAlertDialog(
                                context,
                                value[index],
                                pickdate(value[index].lastUpdated.toString()),
                              );
                            },
                            child: Container(
                              height: _height * 0.2,
                              padding: EdgeInsets.only(bottom: _height * 0.03),
                              child: Card(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 10,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CachedNetworkImage(
                                        height: 100,
                                        width: 100,
                                        imageUrl:
                                            value[index].image.split("?")[0],
                                        placeholder: (context, url) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
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
                                            Flexible(
                                              child: Text(
                                                value[index].name,
                                                maxLines: 1,
                                                style: GoogleFonts.lato(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                overflow: TextOverflow.clip,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: _height * 0.04,
                                      ),
                                      Text(
                                        "CP: ${value[index].currentPrice.toString()}",
                                        style: GoogleFonts.lato(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoinDetail extends StatelessWidget {
  const CoinDetail({
    required String text,
    required String detail,
    required double textSize,
    required Color color,
    Key? key,
  })  : _text = text,
        _detaiil = detail,
        _textSize = textSize,
        _color = color,
        super(key: key);

  final String _text;
  final String _detaiil;
  final double _textSize;
  final Color _color;
  @override
  Widget build(BuildContext context) {
    return Text(
      "${_detaiil} ${_text}",
      style: GoogleFonts.roboto(
        fontSize: _textSize,
        fontWeight: FontWeight.w500,
        color: _color,
      ),
    );
  }
}
