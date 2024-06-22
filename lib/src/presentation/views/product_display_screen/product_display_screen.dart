import 'package:cart_item/cart_item.dart';
import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/constant/size_config.dart';
import 'package:intl/intl.dart';

import '../../../../app/routes/app_route.dart';
import '../../../../constant/colors.dart';
import '../../../../constant/divider.dart';
import '../../../../core/widgets/heading.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../../widgets/app_bar.dart';

class ProductDisplayScreen extends StatefulWidget {
  const ProductDisplayScreen({super.key});

  @override
  State<ProductDisplayScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen> {
  var productQuantity = 3;

  void _incrementQuantity() {
    setState(() {
      productQuantity++;
    });
  }

  void _lessenQuantity() {
    setState(() {
      productQuantity = productQuantity <= 0 ? 0 : productQuantity - 1;
    });
  }

  int _counterInit = 0;
  int _counter = 1;
  int _counterLimit = 1;

  double _dCounter = 0.01;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: SizeConfig.height(context, 0.6),
                    width: SizeConfig.width(context, 1),
                    color: GlobalColor.productBgColor,
                    child: Image.asset('assets/images/product_img.png'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.width(context, 0.05),
                    ),
                    margin:
                        EdgeInsets.only(top: SizeConfig.height(context, 0.02)),
                    width: SizeConfig.width(context, 1),
                    height: SizeConfig.height(context, 0.1),
                    child: AppBarWidget(),
                  ),
                ],
              ),
              buildVerticalDivider(context, 0.04),
              _buildSectionTitle(context, "Modern Chair"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.width(context, 0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeadingTextWidget(
                text: title,
                fontSize: SizeConfig.height(context, 0.03),
                color: GlobalColor.head2TextColor,
                fontWeight: FontWeight.w900,
              ),
              _buildRatingLabel(context),
            ],
          ),
          buildVerticalDivider(context, 0.01),
          SubHeadingTextWidget(
            text: 'Armchair',
            fontSize: SizeConfig.width(context, 0.04),
            fontWeight: FontWeight.w500,
            color: GlobalColor.productDisColor,
          ),
          buildVerticalDivider(context, 0.01),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: SizeConfig.width(context, 0.04),
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      "The simple and elegant shape makes it very suitable for those for you who like those of you who wants a minimalist room",
                  style: TextStyle(
                    color: GlobalColor.productDisColor,
                    fontSize: SizeConfig.width(context, 0.04),
                  ),
                ),
                TextSpan(
                  text: ' Read More',
                  style: TextStyle(
                      color: GlobalColor.head2TextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.width(context, 0.04)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, AppRoute.signUpScreen);
                    },
                ),
              ],
            ),
          ),
          _buildBestSellerList(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeadingTextWidget(
                text: 'Color',
                fontSize: SizeConfig.height(context, 0.02),
                color: GlobalColor.head2TextColor,
                fontWeight: FontWeight.w900,
              ),
              CircleAvatar(
                radius: SizeConfig.width(context, 0.02),
                backgroundColor: Colors.red,
              ),
              CircleAvatar(
                radius: SizeConfig.width(context, 0.02),
                backgroundColor: Colors.grey,
              ),
              CircleAvatar(
                radius: SizeConfig.width(context, 0.02),
                backgroundColor: Colors.brown,
              ),
              CartStepperInt(
                value: _counter,
                size: 20,
                didChangeCount: (count) {
                  setState(() {
                    _counter = count;
                  });
                },
                style: CartStepperStyle(

                ),
              ),
            ],
          ),
          /*Center(
            child: Column(children: [
              CartItem(
                color: Colors.white24,
                name: 'Graphic T-shirt',
                price: 12.99,
                quantity: productQuantity,
                imageUrl:
                'https://uk.elis.com/sites/uk.elis.com/files/styles/product_cover/public/catalog/product/ID_0300_white_300_dpi_YR14.png?h=7d612996&itok=SrDfm6k8',
                onAdd: () => {_incrementQuantity()},
                onRemove: () => {_lessenQuantity()},
              ),
            ]),
          ),*/

        ],
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

  Widget _buildBestSellerList(BuildContext context) {
    return SizedBox(
      width: SizeConfig.width(context, 1),
      height: SizeConfig.height(context, 0.15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return _buildBestSellerImage(context);
        },
      ),
    );
  }

  Widget _buildBestSellerImage(BuildContext context) {
    return Container(
      height: SizeConfig.height(context, 0.1),
      width: SizeConfig.width(context, 0.2),
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.height(context, 0.03),
        horizontal: SizeConfig.width(context, 0.02),
      ),
      decoration: BoxDecoration(
        color: GlobalColor.productBgColor,
        borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.05)),
      ),
      child: Center(
        child: Image.asset('assets/images/product_img.png'),
      ),
    );
  }
}
