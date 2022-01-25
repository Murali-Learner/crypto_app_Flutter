import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/models/apiModel.dart';
import 'package:crypto_app/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

showAlertDialog(BuildContext context, CoinApiModel model, String parseDate) {
  final _height = MediaQuery.of(context).size.height;
  final _width = MediaQuery.of(context).size.width;

  Widget okButton = TextButton(
    child: const Text(
      "OK",
      style: TextStyle(fontSize: 20),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    contentPadding: const EdgeInsets.only(top: 10.0),
    alignment: Alignment.center,
    actions: [okButton],
    content: Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Container(
        // padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [
            Text(
              model.symbol.toUpperCase(),
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              height: _height * 0.02,
            ),
            Text(
              model.name,
              style: GoogleFonts.lato(
                color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: _height * 0.03,
            ),
            Text(
              "Current Price: ${model.currentPrice.toString()}",
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            SizedBox(
              height: _height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CoinDetail(
                  detail: "  Low 24\n",
                  text: model.low24H.toStringAsFixed(2),
                  color: Colors.black87,
                  textSize: 18,
                ), //low24
                SizedBox(
                  width: _height * 0.1,
                ),
                CoinDetail(
                  detail: "  High 24\n",
                  textSize: 18,
                  text: model.high24H.toStringAsFixed(2),
                  color: Colors.black87,
                ),
              ],
            ),
            SizedBox(
              height: _height * 0.03,
            ),
            CachedNetworkImage(
              height: 150,
              width: 150,
              imageUrl: model.image.split("?")[0],
              placeholder: (context, url) {
                return const Center(child: CircularProgressIndicator());
              },
            ),
            SizedBox(
              height: _height * 0.02,
            ),
            CoinDetail(
              detail: "Last Update: ",
              textSize: 18,
              color: Colors.black87,
              text: parseDate,
            ),
          ],
        ),
      ),
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
