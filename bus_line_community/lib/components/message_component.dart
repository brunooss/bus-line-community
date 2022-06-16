import 'package:bus_line_community/models/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


class MessageWidget extends StatelessWidget {

  Message message;
  bool isOwnMessage = false;

  MessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    isOwnMessage = (message.sender == FirebaseAuth.instance.currentUser!.displayName);

    return Wrap(
          alignment: WrapAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB((isOwnMessage? 40.0: 8.0), 8.0, (isOwnMessage? 8.0: 40.0), 8.0),
              child: Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: (isOwnMessage? Color.fromARGB(255, 34, 196, 169): Color(0xFFDDDDDD)),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding( 
                  padding: const EdgeInsets.only(
                    left: 8,
                    top: 8,
                    right: 8,
                    bottom: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(message.sender,
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.0,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.ltr,
                              maxLines: 1),
                          Text(message.sendTime.toString(),
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: const Color(0xFF4D4D4D),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.0,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.ltr,
                              maxLines: 1),
                        ],
                      ),
                      Text(message.text,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
  }
}