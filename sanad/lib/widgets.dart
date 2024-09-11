import 'package:flutter/material.dart';
import 'package:sanad/models.dart';

class WelcomButton extends StatelessWidget {
  const WelcomButton({super.key, required this.title, required this.onPressed});
  final String title;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          backgroundColor: Colors.deepPurple,
          fixedSize: Size(MediaQuery.sizeOf(context).width / 2, 15)),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.activity});
  final Activity activity;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 1.1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      activity.name,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
              // width: MediaQuery.sizeOf(context).width / 1.3,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(65, 28, 23, 23),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Tt(title: 'type', des: activity.type),
                  _Tt(title: 'date', des: activity.date.toString()),
                  _Tt(title: 'city', des: activity.city),
                  _Tt(title: 'adress', des: activity.adress),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    onPressed: () {},
                    icon: activity.is_fav
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border_outlined)),
                IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    onPressed: () {},
                    icon: const Icon(Icons.add_card_outlined)),
                IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ActivityDetailCard(
                              activity: Activity(
                                  name: 'programming club',
                                  type: 'club',
                                  adress: 'shahbaa',
                                  city: 'aleppo',
                                  date: '1/1/2025',
                                  duration: 12,
                                  description:
                                      'hi \n this is the description of the activity , here goes some text bla bla bla jkjkjkjjkjkjkjkjkjkjkjkjkjjkjkjkjjkjkjkjkjkjkjkjkjkjjkjkjkjjkjkjkjkjkjkjkjkjkjjkjkjkjjkjkjkjkjkjkjkjkjkj'),
                            );
                          });
                    },
                    icon: const Icon(Icons.info_outline)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Tt extends StatelessWidget {
  //the rows in the activity card
  const _Tt({super.key, required this.title, required this.des});
  final String title;
  final String des;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        Text('  ' + des)
      ],
    );
  }
}

class FilterChipp extends StatelessWidget {
  const FilterChipp(
      {super.key,
      required this.selected,
      required this.onselected,
      required this.title});
  final bool selected;
  final Function(bool) onselected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        label: Text(title),
        selected: selected,
        onSelected: onselected,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        selectedColor: Color.fromARGB(255, 201, 34, 206),
        disabledColor: Color.fromARGB(255, 156, 121, 170),
      ),
    );
  }
}

class ActivityDetailCard extends StatelessWidget {
  const ActivityDetailCard({super.key, required this.activity});
  final Activity activity;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.sizeOf(context).width / 1.1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      activity.name,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
              // width: MediaQuery.sizeOf(context).width / 1.3,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(65, 28, 23, 23),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Tt(title: 'type', des: activity.type),
                  _Tt(title: 'date', des: activity.date.toString()),
                  _Tt(title: 'city', des: activity.city),
                  _Tt(title: 'adress', des: activity.adress),
                  _Tt(
                      title: 'duratin',
                      des: activity.duration.toString() + ' hours'),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                // width: MediaQuery.sizeOf(context).width / 1.3,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(65, 28, 23, 23),
                    borderRadius: BorderRadius.circular(15)),
                child: SingleChildScrollView(
                  child: Text(activity.description),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    onPressed: () {},
                    icon: activity.is_fav
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border_outlined)),
                IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    onPressed: () {},
                    icon: const Icon(Icons.add_card_outlined)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DrawerCategory extends StatelessWidget {
  const DrawerCategory(
      {super.key,
      required this.name,
      required this.items,
      required this.onselected});
  final String name;
  final List items;
  final void Function(bool v, int i) onselected;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '  $name ',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline))
          ],
        ),
        SizedBox(
          height: 200,
          child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              shrinkWrap: true,
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3, crossAxisCount: 2),
              itemBuilder: (context, i) {
                return FilterChipp(
                    selected: i & 2 == 0,
                    onselected: (v) => onselected(v, i),
                    title: items[i]);
              }),
        ),
      ],
    );
  }
}
