import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/models/dropdown_item.dart';

class FiltersPage extends StatefulWidget {
  final Function(String, String) onItemSelected;

  
  FiltersPage({super.key, required this.onItemSelected,  });
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;
  int selectedIndex = 0; // Track the index of the selected item

  List<DropdownItem> items = [
    DropdownItem(
      title: 'Workout National',
      subtitle: '2',
      icon: '52',
    ),
    DropdownItem(
      title: 'Workout Latam',
      subtitle: '2019',
      icon: 'assets/svg/gold.svg',
    ),

    
  ];

  @override
void initState() {
  super.initState();
  controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 500),
  );
  slideAnimation = Tween<Offset>(
    begin: Offset(0.0, -1.0), 
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.ease, 
  ));
  fadeAnimation = Tween<double>(
    begin: 0.0, 
    end: 1.0, 
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.easeInOut, 
  ));
  controller.forward();
}
 @override
Widget build(BuildContext context) {
  return SlideTransition(
    position: slideAnimation,
    child: FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('seasons').get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final items = snapshot.data!.docs.map((doc) => DropdownItem(title: doc["title"], subtitle: doc["subtitle"], icon: doc["icon"])).toList();
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              padding: const EdgeInsets.all(13.0),
              height: MediaQuery.of(context).size.height / 2.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(45, 46, 49, 1),
              ),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = items[index];
                  bool isSelected = index == selectedIndex; 

                  return FadeTransition(
                    opacity: fadeAnimation,
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              fontFamily: 'Halenoir',
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            item.subtitle,
                            style: TextStyle(
                              fontFamily: 'Halenoir',
                              fontSize: 20,
                              color: isSelected ? Colors.grey.withOpacity(0.6) : Colors.grey.withOpacity(0.4),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      trailing: item.icon.endsWith('.svg')
                        ? SvgPicture.asset(
                            item.icon,
                            width: 30,
                            height: 30,
                          )
                        : Text(
                            item.icon,
                            style: TextStyle(
                              fontFamily: 'Halenoir',
                              fontSize: 24,
                              color: isSelected ? Colors.grey.withOpacity(0.6) : Colors.grey.withOpacity(0.4),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          Navigator.pop(context);
                        });
                        widget.onItemSelected(item.title, item.subtitle);
                      },
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    ),
  );
}
    }