// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:subspacenewsapp/DetailedNewsScreen.dart';

class NewsHeading extends StatelessWidget {
  final String? heading;
  final String? imageUrl;
  final String? id;

  const NewsHeading(
      {super.key,
      required this.heading,
      required this.imageUrl,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailedNewsScreen(
                title: heading, imageUrl: imageUrl, id: id);
          }));
        },
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      heading ?? "Heading of the imae",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: imageUrl != null
                            ? Image.network(
                                imageUrl!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              )
                            : const SizedBox())
                  ],
                ),
              )),
        ));
  }
}
