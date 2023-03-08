import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grobox/components/category_card.dart';
import 'package:grobox/components/product_card.dart';
import 'package:grobox/components/search_form.dart';
import 'package:grobox/components/section_title.dart';
import 'package:grobox/constants/constants.dart';
import 'package:grobox/models/category.dart';
import 'package:grobox/models/product.dart';
import 'package:grobox/screens/category_product_list_screen.dart';
import 'package:grobox/screens/detail_screen.dart';
import 'package:grobox/screens/product_list_screen.dart';
import 'package:grobox/services/category_service.dart';
import 'package:grobox/services/product_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Product> products = [];
  List<Product> newArrivals = [];
  List<Product> popular = [];
  List<Category> categories = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getinitalData();
  }

  getinitalData() async {
    newArrivals = await ProductService.getNewArrivals();
    popular = await ProductService.getPopularProducts();
    categories = await CategoryService.getCategories();
    setState(() {
      print("newArrivals: ${newArrivals.length}");
      print("popular: ${popular.length}");
      print("categories: ${categories.length}");
    });
  }

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
              '123 Main Street, Bengaluru',
              style: Theme.of(context).textTheme.titleMedium,
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
      body: RefreshIndicator(
        onRefresh: () {
          getinitalData();
          return Future.value();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
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
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: defaultPadding),
                      child: CategoryCard(
                        press: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CategoryProductListScreen(
                                category: categories[index],
                              ),
                            ),
                          );
                        },
                        title: categories[index].name ?? "",
                        iconUrl: categories[index].icon ?? "",
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: defaultPadding),
              SectionTitle(
                title: "New Arrivals",
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProductListScreen(
                        title: "New Arrivals",
                      ),
                    ),
                  );
                },
              ),
              // list of new arrivals
              SizedBox(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newArrivals.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: defaultPadding),
                      child: ProductCard(
                        icon: newArrivals[index].icon ?? "",
                        title: newArrivals[index].name ?? "",
                        color: const Color(0xFFEFEFF2),
                        price: newArrivals[index].price ?? 0,
                        press: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                product: newArrivals[index],
                              ),
                            ),
                          ),
                        },
                      ),
                    );
                  },
                ),
              ),
              SectionTitle(
                title: "Popular",
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProductListScreen(
                        title: "Popular",
                      ),
                    ),
                  );
                },
              ),
              // list of popular products
              Container(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popular.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: defaultPadding),
                      child: ProductCard(
                        icon: popular[index].icon ?? "",
                        title: popular[index].name ?? "",
                        color: const Color(0xFFEFEFF2),
                        price: popular[index].price ?? 0,
                        press: () => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                product: popular[index],
                              ),
                            ),
                          ),
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
