import 'package:flutter/material.dart';
import 'package:grobox/components/category_card.dart';
import 'package:grobox/components/search_form.dart';
import 'package:grobox/components/section_title.dart';
import 'package:grobox/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List demoCategories = [
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/1334/1334203.png",
      "title": "Sneakers",
      "press": () {},
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/9007/9007272.png",
      "title": "Snow Boots",
      "press": () {},
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/8995/8995610.png",
      "title": "hiking Boots",
      "press": () {},
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/8337/8337586.png",
      "title": "Stilettos",
      "press": () {},
    },
    {
      "icon": "https://cdn-icons-png.flaticon.com/512/7990/7990864.png",
      "title": "Flip Flops",
      "press": () {},
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.black,
              size: 12,
            ),
            const SizedBox(width: defaultPadding / 2),
            Text(
              '123 Main Street, New York',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: defaultPadding / 2),
            const Text(
              "Best Selling Footwear",
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
            // list of categories
            SizedBox(
              height: 92,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: demoCategories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: defaultPadding),
                    child: CategoryCard(
                      press: demoCategories[index]["press"],
                      title: demoCategories[index]["title"],
                      iconUrl: demoCategories[index]["icon"],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: defaultPadding),
            SectionTitle(
              title: "New Arrivals",
              press: () {},
            ),
            Column(
              children: [
              ],
            )
          ],
        ),
      ),
    );
  }
}
