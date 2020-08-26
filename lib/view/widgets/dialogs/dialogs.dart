import 'package:flutter/material.dart';

class Dialogs {
  static Future<T> showDialogInformation<T>({
    BuildContext context,
    String icon,
    String title,
    String description,
    String textButton,
    VoidCallback close,
  }) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return Hero(
          tag: 'show-location',
          child: SimpleDialog(
            backgroundColor: Colors.white,
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.all(0),
            titlePadding: EdgeInsets.all(0),
            title: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  // SvgPicture.asset(icon),
                  Icon(Icons.location_on),
                  SizedBox(height: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 15),
              // FlatButton(
              //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //   color: primaryColor,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(8),
              //       bottomRight: Radius.circular(8),
              //     ),
              //   ),
              //   onPressed: clickOk,
              //   child: Center(
              //     child: Padding(
              //       padding: const EdgeInsets.all(16.0),
              //       child: Text(
              //         textButton,
              //         style:
              //             TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
    return result;
  }
}
