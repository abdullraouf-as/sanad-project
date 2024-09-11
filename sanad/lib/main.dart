import 'package:flutter/material.dart';
import 'package:sanad/constant.dart';
import 'package:sanad/models.dart';
import 'package:sanad/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sanad',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ActivityPage(),
    );
  }
}

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      appBar: AppBar(
        title: const Center(
          child: Text('sanad'),
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filter By',
                style: TextStyle(
                    fontSize: 22,
                    // fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: 50,
              ),
              DrawerCategory(
                items: cities,
                name: 'city',
                onselected: (v, i) {
                  print(i.toString());
                },
              ),
              DrawerCategory(
                items: types,
                name: 'type',
                onselected: (v, i) {
                  print(i.toString());
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilterChipp(
                    selected: false, onselected: (v) {}, title: 'finished'),
                FilterChipp(selected: true, onselected: (v) {}, title: 'all'),
                FilterChipp(
                    selected: false, onselected: (v) {}, title: 'favorite'),
                FilterChipp(
                    selected: false, onselected: (v) {}, title: 'registered'),
                FilterChipp(
                    selected: false, onselected: (v) {}, title: 'enrolled'),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 1.21,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, i) {
                  return ActivityCard(
                    activity: Activity(
                        name: 'name',
                        type: 'type',
                        adress: 'adress',
                        city: 'city',
                        is_fav: i % 2 == 0,
                        date: '1/1/2025',
                        duration: 5),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class WelcomPage extends StatefulWidget {
  const WelcomPage({super.key});

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 1.5,
              child: const Center(child: Text('logo goes here')),
            ),
            WelcomButton(
                title: 'sing in ',
                onPressed: () {
                  print('object');
                }),
            WelcomButton(
                title: 'sing up ',
                onPressed: () {
                  print('object');
                }),
          ],
        ),
      ),
    );
  }
}
