import 'package:flutter/material.dart';
import 'package:sanad/cubit/home_cubit.dart';
import 'package:sanad/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
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
                          selected: false,
                          onselected: (v) {},
                          title: 'finished'),
                      FilterChipp(
                          selected: true, onselected: (v) {}, title: 'all'),
                      FilterChipp(
                          selected: false,
                          onselected: (v) {},
                          title: 'favorite'),
                      FilterChipp(
                          selected: false,
                          onselected: (v) {},
                          title: 'registered'),
                      FilterChipp(
                          selected: false,
                          onselected: (v) {},
                          title: 'enrolled'),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 1.21,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.data.length,
                      itemBuilder: (context, i) {
                        return ActivityCard(activity: state.data[i]
                            //  Activity(
                            //     name: 'name',
                            //     type: 'type',
                            //     adress: 'adress',
                            //     city: 'city',
                            //     is_fav: i % 2 == 0,
                            //     date: '1/1/2025',
                            //     duration: 5),
                            );
                      }),
                )
              ],
            ),
          );
        } else if (state is HomeLoading) {
          return CircularProgressIndicator();
        } else if (state is HomeError) {
          return Center(
            child: Text(state.error),
          );
        }
        return Icon(Icons.error);
      },
    );
  }
}
