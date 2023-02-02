
import 'package:flutter/material.dart';
import 'package:grobox/constants/constants.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Search footwear ...",
          // hintStyle: TextStyle(color: Colors.black, fontSize: 18),
          prefixIcon: const Icon(Icons.search),
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: defaultPadding / 2,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                  color: primaryColor,
                ),
                child: const Icon(
                  Icons.tune,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(defaultBorderRadius),
  borderSide: BorderSide.none,
);
