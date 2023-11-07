import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class UserHeader extends StatelessWidget {
  const UserHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.0,),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.black, 
                      spreadRadius:
                          0.5,
                      blurRadius: 6, 
                      offset: Offset(0, 4), 
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/flutterworkoutapp.appspot.com/o/kram.png?alt=media&token=f4a9a4eb-42d1-4517-9531-c8b9eee60d4f"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "User placeholder",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Halenoir',
                        fontWeight: FontWeight.bold,
                        fontSize: 30), 
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Description placeholder",
                    style: TextStyle(
                        color: Colors.white38,
                        fontFamily: 'Halenoir',
                        fontWeight: FontWeight.w300,
                        fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 35.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/gold.svg',
                        height: 30,
                        width: 30,
                      ),
                      const Text(
                        "Ranking",
                        style: TextStyle(
                            color: Colors.white38,
                            fontFamily: 'Halenoir',
                            fontWeight: FontWeight.w300,
                            fontSize: 15),
                      )
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "3 214",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Halenoir',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        "Points",
                        style: TextStyle(
                            color: Colors.white38,
                            fontFamily: 'Halenoir',
                            fontWeight: FontWeight.w300,
                            fontSize: 15),
                      )
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "24",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Halenoir',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        "Goal Streaks",
                        style: TextStyle(
                            color: Colors.white38,
                            fontFamily: 'Halenoir',
                            fontWeight: FontWeight.w300,
                            fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            ],
          );
  }}