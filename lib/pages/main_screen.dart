import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project/models/ranking_item.dart';
import 'package:project/pages/profile_screen.dart';

import 'package:project/widgets/MainAppBar.dart';
import 'package:project/widgets/ScaffoldDrawer.dart';
import 'package:project/widgets/TopListElement.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> widgetOptions = <Widget>[
    TopList(),
    const Text(
      'Likes',
      style: optionStyle,
    ),
    const Text(
      'Sa',
      style: optionStyle,
    ),
    const Text(
      'Search',
      style: optionStyle,
    ),
    const Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  String dropDownTitle = "Workout Season";
  int number = 2;

  //Configurations
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final accentColor = const Color.fromRGBO(45, 46, 49, 1);
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  double scrollProgress = 0.0;

//BottomNavbar configuration
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

//Here goes the fetch from firebase but I generated some placeholders
  /* List<RankingItem> items = List.generate(
    50,
    (index) => RankingItem(
      rank: index + 1,
      avatarUrl:
          'https://picsum.photos/id/237/200/300', //'https://picsum.photos/id/${index + 1}',
      name: 'User ${index + 1}',
      points: '${(index + 1) * 1000}',
      hasAdvanced: index % 2 == 0,
      hasDecreased: index % 2 == 1,
    ),
  );
*/
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double maxScrollExtent = _scrollController.position.maxScrollExtent;
      double currentScrollPosition = _scrollController.offset;
      scrollProgress = currentScrollPosition / maxScrollExtent;

      // Update your state based on the scroll progress.
      // For example, you could use setState to update your widget.
      if ((scrollProgress * 10).round() % 2 == 0) {
        // Update your state based on the scroll progress.
        setState(() {
          print(scrollProgress);
          // Your state update logic goes here.
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(
        dropDownTitle: dropDownTitle,
        number: number,
        onTap: () {
          _scaffoldKey.currentState!.openEndDrawer();
        },
      ),
      endDrawer: FiltersPage(
        onItemSelected: (String title, String subtitle) {
          setState(() {
            dropDownTitle = title;
            number = int.parse(subtitle); // Assuming the subtitle is a number
          });
        },
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 15.0,
              backgroundColor: accentColor,
              automaticallyImplyLeading: false,
              actions: [Container()],
              flexibleSpace: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SetAvatarHeader(
                              imageUrl:
                                  'https://yt3.googleusercontent.com/ytc/APkrFKYaGmh3BqBiqDMiCE9tesbKp5pRJY_ZXaPujDaA3A=s900-c-k-c0x00ffffff-no-rj',
                              atletheName: "Madeline",
                              points: "5103",
                              size: 35,
                              svgMedal: "silver.svg"),
                          SetAvatarHeader(
                              imageUrl:
                                  'https://static.wikia.nocookie.net/earthbound/images/8/88/Lucas_SSB4.png',
                              size: 50,
                              svgMedal: "gold.svg",
                              atletheName: "Lucas",
                              points: "12132356"),
                          SetAvatarHeader(
                              imageUrl:
                                  'https://static.wikia.nocookie.net/deltarune/images/f/fb/Kris_LINE_sticker_artwork.png',
                              size: 35,
                              svgMedal: "bronce.svg",
                              atletheName: "Kris",
                              points: "120"),
                        ],
                      ),
                    ),
                    Container(
                      width: 25.0,
                      height: 5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
              expandedHeight: 260.0,
              collapsedHeight: 210,
              pinned: true,
              floating: true,
            ),
          ];
        },
        body: Center(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(45, 46, 49, 1),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              // tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.barChartAlt,
                  iconColor: Color.fromRGBO(122, 121, 121, 1),
                  iconSize: 32,
                ),
                GButton(
                  icon: LineIcons.cookie,
                  iconColor: Color.fromARGB(255, 122, 121, 121),
                  iconSize: 32,
                ),
                GButton(
                  icon: LineIcons.clock,
                  iconColor: Color.fromARGB(255, 122, 121, 121),
                  iconSize: 32,
                ),
                GButton(
                  icon: Icons.chat_bubble_outline_rounded,
                  iconColor: Color.fromARGB(255, 122, 121, 121),
                  iconSize: 32,
                ),
                GButton(
                  icon: LineIcons.userCircle,
                  iconColor: Color.fromARGB(255, 122, 121, 121),
                  iconSize: 32,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget TopList() {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('ranking').get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final items = snapshot.data!.docs
              .map((doc) => RankingItem(
                    rank: doc["rank"],
                    avatarUrl: doc["avatarUrl"],
                    name: doc["name"],
                    points: doc["points"],
                    hasAdvanced: doc["hasAdvanced"],
                    hasDecreased: doc["hasDecreased"],
                  ))
              .toList();

          return Container(
            color: const Color.fromRGBO(32, 33, 36, 1),
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Color.fromARGB(28, 189, 189, 189),
                thickness: 1,
                height: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];
                return TopListElement(item: item);
              },
            ),
          );
        }
      },
    );
  }

  Column SetAvatarHeader({
    required String imageUrl,
    required double size,
    required String svgMedal,
    required String atletheName,
    required String points,
  }) {
    const styleTextHeaderRank = TextStyle(
        color: Colors.white,
        fontFamily: 'Halenoir',
        fontWeight: FontWeight.bold,
        fontSize: 18);
    final styleTextRank = TextStyle(
        color: Colors.grey[400],
        fontFamily: 'Halenoir',
        fontWeight: FontWeight.w300);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(1),
                    offset: const Offset(0.0, 10),
                    blurRadius: 8.0 * (1 - scrollProgress),
                    spreadRadius: 2.0 * (1 - scrollProgress),
                  ),
                ],
              ),
              width: size * (1 - scrollProgress) * 2,
              height: size * (1 - scrollProgress) * 2,
              child: GestureDetector(
                onTap: () async {
                  //await Future.delayed(Duration(milliseconds: 100));

                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const ProfileScreen(),
                      transitionDuration: const Duration(milliseconds: 2500),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var curve = Curves.ease;
                        var curveTween = CurveTween(curve: curve);
                        var fadeAnimation = animation.drive(curveTween);

                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl, scale: 1),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0.0, -20.0),
              child: SvgPicture.asset(
                "assets/svg/$svgMedal",
                width: 40,
                height: 34 * (1 + scrollProgress),
              ),
            ),
          ],
        ),
        Text(
          atletheName,
          style: styleTextHeaderRank,
        ),
        Text(
          points,
          style: styleTextRank,
        ),
      ],
    );
  }
}
