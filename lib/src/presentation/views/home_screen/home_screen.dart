import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/app/routes/app_route.dart';
import 'package:insight_artistry_updated/core/widgets/sub_heading.dart';

import '../../../../constant/colors.dart';
import '../../../../constant/divider.dart';
import '../../../../constant/size_config.dart';
import '../../../../core/widgets/heading.dart';
import '../../../../core/widgets/text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();

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
  List<String> categoriesDescription = [
    'Emphasizes spontaneous, automatic, or subconscious creation.',
    'Depicts subjects as they appear in everyday life without embellishment or interpretation.',
    'Focuses on capturing light and its changing qualities, often with visible brush strokes.',
    'Explores the unconscious mind, dream imagery, and illogical scenes.',
    'Deconstructs objects into geometric forms and reassembles them in abstract compositions.',
    'Emphasizes emotional experience rather than physical reality, often through distorted forms and vivid colors.',
    'Incorporates elements from popular and commercial culture, such as advertising, comic books, and mundane cultural objects.',
    'Strips art down to its most fundamental features, often using simple geometric shapes and monochromatic palettes.',
    'Prioritizes the idea or concept over the traditional aesthetic and material aspects of art.',
    'Involves marking or painting on public surfaces, often illegally.'
  ];

  List<TabItem> items = [
    TabItem(
      icon: Icons.notifications_none_sharp,
      title: 'Notification',
    ),
    TabItem(
      icon: Icons.favorite_border_sharp,
      title: 'Favorite',
    ),
    TabItem(
      icon: Icons.home_outlined,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.shopping_cart_outlined,
      title: 'Cart',
    ),
    TabItem(
      icon: Icons.account_box,
      title: 'profile',
    ),
  ];


  List<Widget> _screens = [
    Center(child: Text('Notification Screen', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(child: Text('Favorite Screen', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(child: Text('Home Screen', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(child: Text('Cart Screen', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(child: Text('Profile Screen', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
  ];



  int visit = 0;
  double height = 30;
  Color colorSelect =const Color(0XFF0686F8);
  Color color = const Color(0XFF7AC0FF);
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const  Color(0XFF1752FE);
  final String uniqueTag = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.bgColor,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildVerticalDivider(context, 0.05),
            _buildHeader(context),
            buildVerticalDivider(context, 0.04),
            _buildSearchField(context),
            buildVerticalDivider(context, 0.04),
            _buildSectionTitle(context, "Categories"),
            _buildCategoriesList(context),
            _buildCategoriesImagesList(context),
            buildVerticalDivider(context, 0.04),
            _buildSectionTitle(context, "Best Seller"),
            buildVerticalDivider(context, 0.01),
            _buildBestSellerList(context),
            buildVerticalDivider(context, 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.width(context, 0.05)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeadingTextWidget(
            text: "Discover The Best \nArt.",
            fontSize: SizeConfig.height(context, 0.03),
            color: GlobalColor.head2TextColor,
            fontWeight: FontWeight.w900,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: const AssetImage('assets/images/logo.png'),
            radius: SizeConfig.width(context, 0.08),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.width(context, 0.05)),
      child: TextFieldWidget(
        textEditingController: _searchController,
        textInputType: TextInputType.text,
        obscureText: false,
        icon: true,
        prefixIcon: Icon(
          Icons.search_rounded,
          color: GlobalColor.head2TextColor,
          size: SizeConfig.width(context, 0.08),
        ),
        isSuffixIcon: true,
        readOnly: false,
        hint: "Search for art",
        suffixIcon: Icon(
          Icons.display_settings_sharp,
          color: GlobalColor.head2TextColor,
          size: SizeConfig.width(context, 0.08),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.width(context, 0.05)),
      child: HeadingTextWidget(
        text: title,
        fontSize: SizeConfig.height(context, 0.03),
        color: GlobalColor.head2TextColor,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _buildCategoriesList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: SizeConfig.width(context, 0.025)),
      width: SizeConfig.width(context, 1),
      height: SizeConfig.height(context, 0.1),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: SizeConfig.height(context, 0.02),
              horizontal: SizeConfig.width(context, 0.02),
            ),
            decoration: BoxDecoration(
              color: GlobalColor.head2TextColor,
              borderRadius:
                  BorderRadius.circular(SizeConfig.width(context, 0.08)),
            ),
            child: IntrinsicWidth(
              child: ListTile(
                title: SubHeadingTextWidget(
                  text: _categories[index],
                  color: Colors.white,
                  fontSize: SizeConfig.width(context, 0.04),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoriesImagesList(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoute.productDisplayScreen);
      },
      child: Container(
        padding: EdgeInsets.only(left: SizeConfig.width(context, 0.025)),
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
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.width(context, 0.02)),
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
            _buildFloatingActionButton(context, 'Hearo1'),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context,   final String uniqueTag)
  {
    return CircleAvatar(
      radius: SizeConfig.width(context, 0.04),
      child: FloatingActionButton(
        heroTag: uniqueTag,
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

  Widget _buildBestSellerList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: SizeConfig.width(context, 0.025)),
      width: SizeConfig.width(context, 1),
      height: SizeConfig.height(context, 0.15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return _buildBestSellerItem(context, index);
        },
      ),
    );
  }

  Widget _buildBestSellerItem(BuildContext context, int index) {
    return Container(
      width: SizeConfig.width(context, 0.75),
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.width(context, 0.02)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SizeConfig.width(context, 0.03)),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              _buildBestSellerImage(context),
              Positioned(
                bottom: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // _buildCategoryLabel(context, "New", GlobalColor.newBgColor),
                    buildHorizontalDivider(context, 0.15),
                    _buildRatingLabel(context),
                  ],
                ),
              ),
            ],
          ),
          _buildBestSellerDetails(
              context, "Modern Chair", "Armchair", "\$ 12,500"),
        ],
      ),
    );
  }

  Widget _buildBestSellerImage(BuildContext context) {
    return Container(
      height: SizeConfig.height(context, 0.26),
      width: SizeConfig.width(context, 0.3),
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
    return SizedBox(
      height: SizeConfig.height(context, 0.12),
      width: SizeConfig.width(context, 0.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          _buildFloatingActionButton(context,'Hero2'),
        ],
      ),
    );
  }
}
