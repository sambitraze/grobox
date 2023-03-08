import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grobox/constants/constants.dart';
import 'package:grobox/models/product.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.product});
  final Product product;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavourite = false;
  int selectedSize = 0;
  bool readMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFF2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavourite = !isFavourite;
              });
            },
            icon: isFavourite
                ? const Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.red,
                  ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.4,
                  imageUrl: widget.product.icon!,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: defaultPadding),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(defaultPadding,
                        defaultPadding * 1.5, defaultPadding, defaultPadding),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                widget.product.name!,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            const SizedBox(width: defaultPadding),
                            Text(
                              '₹ ${widget.product.price}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        // product description and read more
                        const SizedBox(height: defaultPadding),
                        Text(
                          widget.product.description!.trim(),
                          maxLines: readMore ? 100 : 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                readMore = !readMore;
                              });
                            },
                            child: Text(
                              readMore ? 'Read Less' : 'Read More',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Colors',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          height: 40,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.product.sizes!.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding / 2),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(defaultBorderRadius),
                                  ),
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                        color: selectedSize == index
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey,
                                        width: 2),
                                  ),
                                ),
                                margin:
                                    index == widget.product.sizes!.length - 1
                                        ? const EdgeInsets.all(0)
                                        : const EdgeInsets.only(
                                            right: defaultPadding),
                                child: Text(
                                  widget.product.sizes![index],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: selectedSize == index
                                              ? Theme.of(context).primaryColor
                                              : Colors.grey,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text('Add to Cart'),
                          ),
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
  }
}
