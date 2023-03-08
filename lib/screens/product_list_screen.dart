import 'package:flutter/material.dart';
import 'package:grobox/components/product_card.dart';
import 'package:grobox/constants/constants.dart';
import 'package:grobox/models/product.dart';
import 'package:grobox/screens/detail_screen.dart';
import 'package:grobox/services/product_service.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.title});
  final String title;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];
  int actualIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInitialData();
  }

  getInitialData() async {
    if (widget.title == "New Arrivals") {
      products = await ProductService.getNewArrivals();
    } else if (widget.title == "Popular") {
      products = await ProductService.getPopularProducts();
    }
    setState(() {
      actualIndex = -2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: (products.length / 2).ceil(),
        itemBuilder: (context, index) {
          if (index == 0) {
            actualIndex = 0;
          } else {
            actualIndex += 2;
          }
          return products.length.isOdd &&
                  index == (products.length / 2).ceil() - 1
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32,8,8,8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ProductCard(
                          title: products[actualIndex].name!,
                          price: products[actualIndex].price!,
                          icon: products[actualIndex].icon!,
                          press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                product: products[actualIndex],
                              ),
                            ),
                          ),
                          color: const Color(0xFFEFEFF2),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProductCard(
                          title: products[actualIndex].name!,
                          price: products[actualIndex].price!,
                          icon: products[actualIndex].icon!,
                          press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                product: products[index],
                              ),
                            ),
                          ),
                          color: const Color(0xFFEFEFF2),
                        ),
                        ProductCard(
                          title: products[actualIndex + 1].name!,
                          price: products[actualIndex + 1].price!,
                          icon: products[actualIndex + 1].icon!,
                          press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                product: products[actualIndex + 1],
                              ),
                            ),
                          ),
                          color: const Color(0xFFEFEFF2),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
