
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../theme/screen_util.dart';
import '../theme/theme_helper.dart';
import 'Searchview.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key})
      : super(
    key: key,
  );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  int selectedIdx = -1; // Track the selected index
  int sliderIndex = 1;

  List<String> itemList = ["3D Design", "Arts & Humanities","Graphic Design","Web Development"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 44,),
                CustomSearchView(
                  onPressedSearchBar: openSearchDelegate,
                  onPressedSuffix: openBottomSheet,
                  autofocus: false,
                  controller: searchController,
                  hintText: "Search for..",
                  suffix: Icon(Icons.filter_list,color: Colors.white,),
                  prefix: Icon(Icons.search_sharp,color: Colors.black,),
                ),
                SizedBox(height: 30,),
                BannerCarousel(),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",style: CustomTextStyles.jostMedium18),
                    Text("VIEW ALL",style: theme.textTheme.titleSmall?.copyWith(color:Color(0xff0961F5) ))
                  ],
                ),

                Container(
                  height: 35.0, // Adjust the height as needed
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedIdx = index; // Update the selected index
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Text(
                                itemList[index],
                                style: theme.textTheme.labelLarge!.copyWith(
                                    color: index == selectedIdx ? Color(0xff0961F5) :  Color(0xffB4BDC4),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 240.0, // Adjust the height as needed
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color:  Colors.black ,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              height: 120.0,
                              width: 250,// Adjust the width as needed

                              child: Center(
                                child: Text(
                                  itemList[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2), // Shadow color
                                    spreadRadius: 1, // Spread radius
                                    blurRadius: 8, // Blur radius
                                    offset: Offset(0, 3), // Offset in x and y
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                ),
                              ),
                              // height: 90.0, // Adjust the width as needed
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Graphic Design",style: theme.textTheme.titleSmall?.copyWith(color: Color(0xffFF6B00)),),
                                      Icon(Icons.favorite_border)
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  ),
                                  Text("Graphic Design Advanced",style: theme.textTheme.titleMedium?.copyWith(color: Colors.black),),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      Text("₹2888",style: CustomTextStyles.mulishExtraBold15Blue,),
                                      SizedBox(width: 15,),
                                      Text("|",style: CustomTextStyles.jostMedium18,),
                                      SizedBox(width: 15,),
                                      Icon(Icons.star,color: Colors.orangeAccent,size: 15,),
                                      Text("4.2",style: CustomTextStyles.mulishExtraBold11,),
                                      SizedBox(width: 15,),
                                      Text("|",style: CustomTextStyles.jostMedium18,),
                                      SizedBox(width: 15,),
                                      Text("7830 Std",style: CustomTextStyles.mulishExtraBold11,),
                                    ],
                                  )
                                ],
                              ),
                              padding: EdgeInsets.only(top: 5,left: 12,right: 15,bottom: 15),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 15,),
              ],
            ),
          ),
        ),
        // body: SizedBox(
        //   width: SizeUtils.width,
        //   child: SingleChildScrollView(
        //     padding: EdgeInsets.only(top: 43.v),
        //     child: Container(
        //       height: 898.v,
        //       width: 394.h,
        //       margin: EdgeInsets.only(
        //         left: 34.h,
        //         bottom: 5.v,
        //       ),
        //       child: Stack(
        //         alignment: Alignment.bottomCenter,
        //         children: [
        //           Align(
        //             alignment: Alignment.centerLeft,
        //             child: Container(
        //               margin: EdgeInsets.only(right: 20.h),
        //               decoration: AppDecoration.fillGray,
        //               child: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Padding(
        //                     padding: EdgeInsets.only(right: 14.h),
        //                     child: CustomSearchView(
        //                       controller: searchController,
        //                       hintText: "Search for..",
        //                     ),
        //                   ),
        //                   SizedBox(height: 30.v),
        //                   _buildOfferComponentStack(context),
        //                   SizedBox(height: 31.v),
        //                   Padding(
        //                     padding: EdgeInsets.only(right: 16.h),
        //                     child: _buildTopMentorRow(
        //                       context,
        //                       text: "Categories",
        //                       text1: "See All",
        //                     ),
        //                   ),
        //                   SizedBox(height: 12.v),
        //                   _buildDDesignRow(context),
        //                   SizedBox(height: 395.v),
        //                   Padding(
        //                     padding: EdgeInsets.only(right: 16.h),
        //                     child: _buildTopMentorRow(
        //                       context,
        //                       text: "Top Mentor",
        //                       text1: "See All",
        //                     ),
        //                   ),
        //                   SizedBox(height: 13.v),
        //                   _buildEightyFourColumn(context),
        //                 ],
        //               ),
        //             ),
        //           ),
        //           _buildPopularCourseColumn(context),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  void openBottomSheet() {

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FilterBottomSheet();
      },
    );
  }

  void openSearchDelegate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchView()),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth:  0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text("Hi, Ronald A. Martin",style: theme.textTheme.headlineSmall!.copyWith(
              color: appTheme.blueGray900,
            ),),
            SizedBox(height: 6,),
            Text("What Would you like to learn Today? \nSearch Belowd."

              , style: CustomTextStyles.labelLargeGray700.copyWith(
              color: appTheme.gray700.withOpacity(0.8),
            ),maxLines: 2,),
          ],
        ),
      ),
      titleSpacing: 0,
actions: [
  Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Icon(Icons.notifications_none_rounded,color: Colors.teal,size: 40,),
  )
],
    );
  }
}


class CustomSearchView extends StatelessWidget {
  CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
    this.onPressedSuffix,
    this.onPressedSearchBar,
  }) : super(
    key: key,
  );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final Function(String)? onChanged;

  final VoidCallback? onPressedSuffix;

  final VoidCallback? onPressedSearchBar;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? GestureDetector(
      onTap: onPressedSearchBar,
          child: Align(
      alignment: alignment ?? Alignment.center,
      child: searchViewWidget(context),
    ),
        )
        : searchViewWidget(context);
  }

  Widget searchViewWidget(BuildContext context) => Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2), // Shadow color
          spreadRadius: 1, // Spread radius
          blurRadius: 8, // Blur radius
          offset: Offset(0, 3), // Offset in x and y
        ),
      ],
    ),
    width: width ?? double.maxFinite,
    child: TextFormField(
      onTap: onPressedSearchBar,
      scrollPadding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      controller: controller,
      focusNode: focusNode ?? FocusNode(),
      autofocus: autofocus!,
      // style: textStyle ?? CustomTextStyles.titleMediumMulishBluegray200,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: decoration,
      validator: validator,
      onChanged: (String value) {
        onChanged!.call(value);
      },
    ),
  );
  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? CustomTextStyles.mulishBold16,
    prefixIcon:
        Container(
          margin: EdgeInsets.fromLTRB(13, 22, 9, 22),
          child: prefix,
        ),
    prefixIconConstraints: prefixConstraints ??
        BoxConstraints(
          maxHeight: 64,
        ),
    suffixIcon: GestureDetector(
      onTap: onPressedSuffix,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 10,
        ),
        margin: EdgeInsets.fromLTRB(30, 13, 10, 13),
        decoration: BoxDecoration(
          color: appTheme.blueA700,
          borderRadius: BorderRadius.circular(10),
        ),
        child: suffix,
      ),
    ),
    suffixIconConstraints: suffixConstraints ??
        BoxConstraints(
          maxHeight: 64,
        ),
    isDense: true,
    contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 20),
    fillColor: fillColor ?? appTheme.whiteA700,
    filled: filled,
    border: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
    enabledBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
    focusedBorder: borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
  );
}


class BannerCarousel extends StatelessWidget {
  final List<String> bannerImages = [

    'https://img.freepik.com/free-photo/vivid-blurred-colorful-wallpaper-background_58702-3964.jpg?w=1380&t=st=1707058443~exp=1707059043~hmac=271615de29ffb6c62d898c7cfa1df269b066dc848b43608cb6105565e697dc01',
    'https://img.freepik.com/free-photo/vivid-blurred-colorful-wallpaper-background_58702-3940.jpg?w=1380&t=st=1707057929~exp=1707058529~hmac=fd86d67f549a64a64b62b919be4842613b27d71e846ba54b1fd466307197ceb7',
    'https://img.freepik.com/free-vector/blue-abstract-background_698452-994.jpg?w=1380&t=st=1707058532~exp=1707059132~hmac=756c3ebca029e092d26408a45b49de41e1421ac4b091bae8bb20eb3c74157069',
    'https://img.freepik.com/free-photo/vivid-blurred-colorful-wallpaper-background_58702-3940.jpg?w=1380&t=st=1707057929~exp=1707058529~hmac=fd86d67f549a64a64b62b919be4842613b27d71e846ba54b1fd466307197ceb7',];
  final CarouselController _carouselController = CarouselController();
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 180.0,
            enableInfiniteScroll: false, // Set this to false
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9, // Set the aspect ratio if needed
            viewportFraction: 1.0, // This makes it full width
          ),
          items: bannerImages.map((url) {
            return Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("20% OFF",style: theme.textTheme.titleMedium),
                  Text("Today’s Special",style: theme.textTheme.headlineSmall?.copyWith(color:Colors.white )),
                  SizedBox(height: 10,),
                  Text("Get a Discount for Every \nCourse Order only Valid for \nToday.!",style: theme.textTheme.titleSmall?.copyWith(color: Colors.white)),
                ],
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.0),
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10.0,
          child: SmoothPageIndicator(
            controller: _pageController,
            count: bannerImages.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.yellow,
              dotColor: Colors.grey,
              dotHeight: 5.0,
              dotWidth: 5.0,
              spacing: 5.0,
            ),
          ),
        ),
      ],
    );
  }
}


class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // Add your filter options and logic here
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter Options',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            // Add your filter widgets here
            // Example: CheckboxListTile, RangeSlider, etc.
            // Customize based on your requirements
            Row(
            children: [
              Container(
                height: 27,
                width: 27,
                decoration: BoxDecoration(
                  color: isChecked ? Color(0xff167F71) : Color(0xFFE8F1FF),
                  border: Border.all(
                    color: isChecked ? Colors.transparent : Color(0xFFB4BDC4),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Container(

                    child: isChecked
                        ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    )
                        : null,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Text('3D Design',style: CustomTextStyles.mulishExtraBold14,),
            ],
          ),
            Row(
              children: [
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: isChecked ? Color(0xff167F71) : Color(0xFFE8F1FF),
                    border: Border.all(
                      color: isChecked ? Colors.transparent : Color(0xFFB4BDC4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(

                      child: isChecked
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text('3D Design',style: CustomTextStyles.mulishExtraBold14,),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: isChecked ? Color(0xff167F71) : Color(0xFFE8F1FF),
                    border: Border.all(
                      color: isChecked ? Colors.transparent : Color(0xFFB4BDC4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(

                      child: isChecked
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text('3D Design',style: CustomTextStyles.mulishExtraBold14,),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: isChecked ? Color(0xff167F71) : Color(0xFFE8F1FF),
                    border: Border.all(
                      color: isChecked ? Colors.transparent : Color(0xFFB4BDC4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(

                      child: isChecked
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text('3D Design',style: CustomTextStyles.mulishExtraBold14,),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: isChecked ? Color(0xff167F71) : Color(0xFFE8F1FF),
                    border: Border.all(
                      color: isChecked ? Colors.transparent : Color(0xFFB4BDC4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(

                      child: isChecked
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text('3D Design',style: CustomTextStyles.mulishExtraBold14,),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: isChecked ? Color(0xff167F71) : Color(0xFFE8F1FF),
                    border: Border.all(
                      color: isChecked ? Colors.transparent : Color(0xFFB4BDC4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(

                      child: isChecked
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text('3D Design',style: CustomTextStyles.mulishExtraBold14,),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: isChecked ? Color(0xff167F71) : Color(0xFFE8F1FF),
                    border: Border.all(
                      color: isChecked ? Colors.transparent : Color(0xFFB4BDC4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(

                      child: isChecked
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text('3D Design',style: CustomTextStyles.mulishExtraBold14,),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: isChecked ? Color(0xff167F71) : Color(0xFFE8F1FF),
                    border: Border.all(
                      color: isChecked ? Colors.transparent : Color(0xFFB4BDC4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(

                      child: isChecked
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text('3D Design',style: CustomTextStyles.mulishExtraBold14,),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: isChecked ? Color(0xff167F71) : Color(0xFFE8F1FF),
                    border: Border.all(
                      color: isChecked ? Colors.transparent : Color(0xFFB4BDC4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(

                      child: isChecked
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text('3D Design',style: CustomTextStyles.mulishExtraBold14,),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: isChecked ? Color(0xff167F71) : Color(0xFFE8F1FF),
                    border: Border.all(
                      color: isChecked ? Colors.transparent : Color(0xFFB4BDC4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(

                      child: isChecked
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text('3D Design',style: CustomTextStyles.mulishExtraBold14,),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: isChecked ? Color(0xff167F71) : Color(0xFFE8F1FF),
                    border: Border.all(
                      color: isChecked ? Colors.transparent : Color(0xFFB4BDC4),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(

                      child: isChecked
                          ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      )
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text('3D Design',style: CustomTextStyles.mulishExtraBold14,),
              ],
            ),
            // Add more filters as needed
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Apply filters and close the bottom sheet
                Navigator.pop(context);
              },
              child: Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}

