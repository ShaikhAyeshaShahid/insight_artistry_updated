import 'package:flutter/material.dart';
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
  TextEditingController serachController = TextEditingController();

  List<String> categories = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.bgColor,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildVerticalDivider(context, 0.05),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width(context, 0.05),
            ),
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
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  radius: SizeConfig.width(context, 0.08),
                )
              ],
            ),
          ),
          buildVerticalDivider(context, 0.04),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width(context, 0.05)),
            child: TextFieldWidget(
              textEditingController: serachController,
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
          ),
          buildVerticalDivider(context, 0.04),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width(context, 0.05)),
            child: HeadingTextWidget(
              text: "Categories",
              fontSize: SizeConfig.height(context, 0.03),
              color: GlobalColor.head2TextColor,
              fontWeight: FontWeight.w900,
            ),
          ),

          ///Categories Names
          Container(
            padding: EdgeInsets.only(left: SizeConfig.width(context, 0.025)),
            width: SizeConfig.width(context, 1),
            height: SizeConfig.height(context, 0.1),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.height(context, 0.02),
                    horizontal: SizeConfig.width(context, 0.02),
                  ),
                  decoration: BoxDecoration(
                    color: GlobalColor.head2TextColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.width(context, 0.08)),
                    ),
                  ),
                  child: IntrinsicWidth(
                    child: ListTile(
                        title: SubHeadingTextWidget(
                      text: categories[index],
                      color: Colors.white,
                      fontSize: SizeConfig.width(context, 0.04),
                    )),
                  ),
                );
              },
            ),
          ),

          ///Categories Images
          Container(
            padding: EdgeInsets.only(left: SizeConfig.width(context, 0.025)),
            width: SizeConfig.width(context, 1),
            height: SizeConfig.height(context, 0.38),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: SizeConfig.width(context, 0.46),
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width(context, 0.02),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.width(context, 0.03)),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: SizeConfig.height(context, 0.28),
                        margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.width(context, 0.02),
                          vertical: SizeConfig.height(context, 0.01),
                        ),
                        decoration: BoxDecoration(
                          color: GlobalColor.productBgColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(SizeConfig.width(context, 0.03)),
                          ),
                        ),
                        child: Center(
                          child: Image.asset('assets/images/product_img.png'),
                        ),
                      ),
                      Positioned(
                        bottom: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: SizeConfig.height(context, 0.02),
                                horizontal: SizeConfig.width(context, 0.03),
                              ),
                              width: SizeConfig.width(context, 0.11),
                              height: SizeConfig.height(context, 0.025),
                              decoration: BoxDecoration(
                                color: GlobalColor.newBgColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      SizeConfig.width(context, 0.08)),
                                ),
                              ),
                              child: SubHeadingTextWidget(
                                text: "New",
                                fontSize: SizeConfig.width(context, 0.035),
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.width(context, 0.01)),
                              margin: EdgeInsets.symmetric(
                                // vertical: SizeConfig.height(context, 0.02),
                                horizontal: SizeConfig.width(context, 0.14),
                              ),
                              width: SizeConfig.width(context, 0.11),
                              height: SizeConfig.height(context, 0.025),
                              decoration: BoxDecoration(
                                color: GlobalColor.ratingBgColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      SizeConfig.width(context, 0.08)),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom:20,
                          right:10,
                          child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                            backgroundColor: GlobalColor.head2TextColor,
                      ),),
                    ],
                  ),
                );
              },
            ),
          ),
          /* Container(
            padding: EdgeInsets.only(left: SizeConfig.width(context, 0.025)),
            width: SizeConfig.width(context, 1),
            height: SizeConfig.height(context, 0.2),
            color: Colors.red,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(

                  color: Colors.amber,
                  child: Center(child: Text('$index')),
                );
              },
            ),
          ),*/
        ],
      ),
    );
  }
}
