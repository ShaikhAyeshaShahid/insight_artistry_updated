import 'dart:math';

import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';

import '../../../../app/routes/app_route.dart';
import '../../../../constant/colors.dart';
import '../../../../constant/divider.dart';
import '../../../../constant/size_config.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/heading.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../../widgets/app_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> _categories = [
    'Abstract',
    'Realism',
    'Impressionism',
    'Surrealism',
    'Cubism',
    'Expressionism',
    'Pop Art',
    'Minimalism',
    'Conceptual',
    'Street'
  ];
  bool _isChecked = false;

  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonWidget(
        marginWidth: SizeConfig.width(context, 0.05),
        marginHeight: SizeConfig.height(context, 0.01),
        onTab: () {
          Navigator.pushNamed(context, AppRoute.cartScreen);
        },
        text: "Proceed to checkout",
        fontSize: SizeConfig.width(context, 0.04),
        fontWeight: FontWeight.w800,
      ),
      body: Container(
        width: SizeConfig.width(context, 1),
        height: SizeConfig.height(context, 1),
        padding:
        EdgeInsets.symmetric(horizontal: SizeConfig.width(context, 0.05)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildVerticalDivider(context, 0.03),
              AppBarWidget(
                icon: Icons.delete_sharp,
                text: "Cart",
              ),
              _buildBestSellerList(context),
              buildVerticalDivider(context, 0.03),
              _buildSectionTitle(context, "Recently View"),
              _buildCategoriesImagesList(context),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBestSellerList(BuildContext context) {
    return Container(
      /*padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.width(context, 0.025)),*/
      width: SizeConfig.width(context, 1),
      height: SizeConfig.height(context, 0.45),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return _buildBestSellerItem(context, index);
        },
      ),
    );
  }

  Widget _buildBestSellerItem(BuildContext context, int index) {
    return Container(
      width: SizeConfig.width(context, 0.7),
      height: SizeConfig.height(context, 0.12),
      margin: EdgeInsets.symmetric(vertical: SizeConfig.height(context, 0.01)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.03)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            activeColor: GlobalColor.head2TextColor,
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              }),
          _buildBestSellerImage(context),
          _buildBestSellerDetails(
              context, "Modern Chair", "Armchair", "\$ 12,500"),
        ],
      ),
    );
  }

  Widget _buildBestSellerImage(BuildContext context) {
    return Container(
      height: SizeConfig.height(context, 0.25),
      width: SizeConfig.width(context, 0.24),
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(context, 0.02),
        vertical: SizeConfig.height(context, 0.01),
      ),
      decoration: BoxDecoration(
        color: GlobalColor.productBgColor,
        borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.03)),
      ),
      child: Center(
        child: Image.asset('assets/images/product_img.png'),
      ),
    );
  }

  Widget _buildBestSellerDetails(
      BuildContext context, String title, String subtitle, String price) {
    return Container(
      height: SizeConfig.height(context, 0.12),
      width: SizeConfig.width(context, 0.5),
      margin: EdgeInsets.symmetric(vertical: SizeConfig.height(context, 0.01),),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubHeadingTextWidget(
                text: title,
                fontSize: SizeConfig.width(context, 0.04),
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
              SubHeadingTextWidget(
                text: subtitle,
                fontSize: SizeConfig.width(context, 0.035),
                fontWeight: FontWeight.w300,
                color: GlobalColor.productDisColor,
              ),
              SubHeadingTextWidget(
                text: price,
                fontSize: SizeConfig.width(context, 0.04),
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ],
          ),
          Container(
            height: SizeConfig.height(context, 0.04),
            child: CartStepperInt(
              size: SizeConfig.width(context, 0.055),
              value: _counter,
              didChangeCount: (count) {
                setState(() {
                  _counter = count;
                });
              },
              style: CartStepperStyle(
                activeBackgroundColor: GlobalColor.head2TextColor,
                border: Border.all(color: Colors.white,),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSectionTitle(BuildContext context, String title) {
    return HeadingTextWidget(
      text: title,
      fontSize: SizeConfig.height(context, 0.025),
      color: GlobalColor.head2TextColor,
      fontWeight: FontWeight.w900,
    );
  }
  Widget _buildCategoriesImagesList(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoute.productDisplayScreen);
      },
      child: Container(
        width: SizeConfig.width(context, 1),
        height: SizeConfig.height(context, 0.4),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            return _buildCategoryItem(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    return Container(
      width: SizeConfig.width(context, 0.46),
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.width(context, 0.01)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.03)),
      ),
      child: Stack(
        children: [
          _buildCategoryImage(context),
          Positioned(
            bottom: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryLabel(context, "New", GlobalColor.newBgColor),
                buildHorizontalDivider(context, 0.15),
                _buildRatingLabel(context),
              ],
            ),
          ),
          _buildCategoryDetails(
              context, "Modern Chair", "Armchair", "\$ 12,500"),
        ],
      ),
    );
  }

  Widget _buildCategoryImage(BuildContext context) {
    return Container(
      height: SizeConfig.height(context, 0.28),
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(context, 0.02),
        vertical: SizeConfig.height(context, 0.01),
      ),
      decoration: BoxDecoration(
        color: GlobalColor.productBgColor,
        borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.03)),
      ),
      child: Center(
        child: Image.asset('assets/images/product_img.png'),
      ),
    );
  }

  Widget _buildCategoryLabel(BuildContext context, String text, Color bgColor) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.height(context, 0.02),
        horizontal: SizeConfig.width(context, 0.03),
      ),
      width: SizeConfig.width(context, 0.11),
      height: SizeConfig.height(context, 0.025),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.08)),
      ),
      child: Center(
        child: SubHeadingTextWidget(
          text: text,
          fontSize: SizeConfig.width(context, 0.035),
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildRatingLabel(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: SizeConfig.width(context, 0.01)),
      width: SizeConfig.width(context, 0.11),
      height: SizeConfig.height(context, 0.025),
      decoration: BoxDecoration(
        color: GlobalColor.ratingBgColor,
        borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.08)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.star,
            color: GlobalColor.ratingTextColor,
            size: SizeConfig.width(context, 0.03),
          ),
          SubHeadingTextWidget(
            text: "4.8",
            fontSize: SizeConfig.width(context, 0.035),
            fontWeight: FontWeight.w300,
            color: GlobalColor.ratingTextColor,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryDetails(
      BuildContext context, String title, String subtitle, String price) {
    return Positioned(
      bottom: 15,
      left: SizeConfig.width(context, 0.025),
      child: SizedBox(
        height: SizeConfig.height(context, 0.08),
        width: SizeConfig.width(context, 0.4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubHeadingTextWidget(
                  text: title,
                  fontSize: SizeConfig.width(context, 0.04),
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
                SubHeadingTextWidget(
                  text: subtitle,
                  fontSize: SizeConfig.width(context, 0.035),
                  fontWeight: FontWeight.w300,
                  color: GlobalColor.productDisColor,
                ),
                SubHeadingTextWidget(
                  text: price,
                  fontSize: SizeConfig.width(context, 0.04),
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ],
            ),
            _buildFloatingActionButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context)
  {
    return CircleAvatar(
      radius: SizeConfig.width(context, 0.04),
      child: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        backgroundColor: GlobalColor.head2TextColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

}
