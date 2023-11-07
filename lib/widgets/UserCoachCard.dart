import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';



class UserCoachCard extends StatefulWidget {
  const UserCoachCard({super.key});

  @override
  State<UserCoachCard> createState() => _UserCoachCardState();
}

class _UserCoachCardState extends State<UserCoachCard>  with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
  
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    var curve = Curves.ease; // Change this to your preferred curve
    _animation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: curve,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,

      child: Builder(builder: (BuildContext context) {
        const textTitles = TextStyle(
            color: Colors.white,
            fontFamily: 'Halenoir',
            fontWeight: FontWeight.bold,
            fontSize: 22);
        const textSubtitles = TextStyle(
            color: Colors.white38,
            fontFamily: 'Halenoir',
            fontWeight: FontWeight.w300,
            fontSize: 15);
        return Container(
          height: 210.0,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              Container(
                height: 155.0,
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                color: Color.fromRGBO(45, 46, 49, 1),
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 30,
                    ),
                    Transform.translate(
                      offset: const Offset(0, -25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/flutterworkoutapp.appspot.com/o/357977122_808120014283793_3926952140249787135_n.jpg?alt=media&token=1eae6372-5355-472d-9cd2-be664783201e',
                            fit: BoxFit.fill,
                            height: 128.0,
                            width: 115.0,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          RatingStars(
                            value: 4.5,
                            onValueChanged: (_){},
                            starSize: 10.0,
                            valueLabelVisibility: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    const Expanded(
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Coach Name",
                                      style: textTitles,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Coach Title", style: textSubtitles),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("241", style: textTitles),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Students", style: textSubtitles),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("24", style: textTitles),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Champions", style: textSubtitles),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
