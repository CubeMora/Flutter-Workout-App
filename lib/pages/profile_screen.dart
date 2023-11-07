import 'package:flutter/material.dart';
import 'package:project/widgets/UserCoachCard.dart';
import 'package:project/widgets/UserHeader.dart';
import 'package:project/widgets/UserWorkoutChart.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<Offset> _animationGraphic;
  final progressNotifier = ValueNotifier<double>(34 / 100);

  late double curvedProgress;

  double scrollProgress = 0.0;

  final textSubtitleStyle = const TextStyle(
    color: Colors.white38,
    fontFamily: 'Halenoir',
    fontWeight: FontWeight.w300,
  );

  final textTitleStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Halenoir',
      fontWeight: FontWeight.bold,
      fontSize: 30.0);

  final textMiniTitle = const TextStyle(
      color: Colors.white24,
      fontFamily: 'Halenoir',
      fontWeight: FontWeight.w300,
      fontSize: 16);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animationGraphic = Tween<Offset>(
      begin: const Offset(-1.0, 1.0),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));
    _animationController.forward();
    curvedProgress = 0.0;

    _scrollController.addListener(() {
      double maxScrollExtent = _scrollController.position.maxScrollExtent;
      double currentScrollPosition = _scrollController.offset;
      double newScrollProgress = currentScrollPosition / maxScrollExtent;
      double newCurvedProgress = Curves.easeIn.transform(newScrollProgress);

      // Only call setState if the scroll progress or curved progress has changed significantly.
      if ((newScrollProgress - scrollProgress).abs() > 0.01 ||
          (newCurvedProgress - curvedProgress).abs() > 0.01) {
        setState(() {
          scrollProgress = newScrollProgress;
          curvedProgress = newCurvedProgress;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 33, 36, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                progressNotifier.value = 100 / 100;
              },
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.only(top: 0.0),
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  //<a href="https://www.freepik.com/free-photo/dumbbells-floor-gym-ai-generative_41368287.htm#query=gym%20wallpaper&position=4&from_view=keyword&track=ais">Image by chandlervid85</a> on Freepik
                  image: const AssetImage(
                      'assets/images/user_profile_background.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.4 * (1 + scrollProgress)),
            ),
            height: MediaQuery.of(context).size.height / 2.7 + (60),
            width: MediaQuery.of(context).size.width,
            child: const UserHeader(),
          ),
          Transform.translate(
            offset: Offset(0, -300 * (curvedProgress)),
            child: const UserCoachCard(),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Transform.translate(
            offset: Offset(0, -5 * (curvedProgress)), //---60
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text("Progress",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Halenoir',
                      fontWeight: FontWeight.bold,
                      fontSize: 28)),
            ),
          ),
          SlideTransition(
            position: _animationGraphic,
            child: Transform.translate(
              offset: Offset(0, -5 * (curvedProgress)), //---50
              child: const UserWorkoutChart(),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text("Steps", style: textMiniTitle),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text("11 476",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Halenoir',
                    fontWeight: FontWeight.bold,
                    fontSize: 100)),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            children: <Widget>[
              UserWorkoutNumbers("Kilometers", 7.8),
              UserWorkoutNumbers("Calories", 252),
              UserWorkoutNumbers("Points", 73),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0, bottom: 30.0),
            child: Text("Exercises done",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Halenoir',
                    fontWeight: FontWeight.bold,
                    fontSize: 23)),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.ltr,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30.0, top: 10),
                child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 0.37),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, _) => SimpleCircularProgressBar(
                          mergeMode: true,
                          valueNotifier: progressNotifier,
                          maxValue: 1,
                          size: 50.0,
                          progressStrokeWidth: 3.0,
                          backStrokeWidth: 3.0,
                          animationDuration: 2,
                          progressColors: const [Colors.cyan],
                          onGetText: (double value) {
                            return Text(
                              '${(value * 100).toInt()}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Halenoir',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            );
                          },
                        )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: 0.3,
                        child: Image.asset(
                          'assets/images/user_last_excercise.jpg',
                          fit: BoxFit.fitWidth,
                          height: 100.0,
                        ),
                      ),
                      const Text("Cobra pose",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Halenoir',
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0))
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }

  Widget UserWorkoutNumbers(String title, double subtitle) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white12)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10.0, right: 30, top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: textMiniTitle,
              ),
              Text(
                  "${subtitle == subtitle.toInt() ? subtitle.toInt().toString() : subtitle}",
                  style: textTitleStyle)
            ],
          ),
        ),
      ),
    );
  }
}
