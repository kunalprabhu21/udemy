import 'package:flutter/material.dart';

import '../../theme/screen_util.dart';
import '../../theme/theme_helper.dart';
import '../Home.dart';




class SearchViewResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      body: YourContentWidget(),
    );
  }
}

class YourContentWidget extends StatefulWidget {
  @override
  _YourContentWidgetState createState() => _YourContentWidgetState();
}

class _YourContentWidgetState extends State<YourContentWidget> {
  String searchQuery = '';
  List<String> suggestions = []; // Simulated dynamic suggestions
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 30,),
          Row(
            children: [

              Icon(Icons.arrow_back_sharp,color: Colors.black,),
              SizedBox(width: 10,),
              Text('Online Courses',style: theme.textTheme.headlineSmall,),

            ],
          ),
          SizedBox(height: 10,),
          CustomSearchView(
            onChanged: (query){
              // setState(() {
              //   searchQuery = query;
              //   suggestions = query.isNotEmpty ? fetchSuggestions(query): [];
              // });
            },
            autofocus: false,
            controller: searchController,
            hintText: "Search for..",
            suffix: Icon(Icons.search_sharp,color: Colors.white,),
            prefix: Icon(Icons.search_sharp,color: Colors.black,),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Result for ",
                      style:
                      theme.textTheme.titleMedium?.copyWith(fontSize: 15,color: Colors.black),
                    ),
                    TextSpan(
                      text: "Graphic Design",
                      style:
                      theme.textTheme.titleMedium?.copyWith(fontSize: 15,color: appTheme.blueA700),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              Text('2480 Founds',style: theme.textTheme.titleSmall?.copyWith(color: appTheme.blueA700),),
            ],
          ),
          SizedBox(height: 15,),
          Container(
   // Background color of the container

    child: Row(
    children: [
    // Image container (one fourth of the width)
    Container(
    width: MediaQuery.of(context).size.width / 4,
    color: Colors.black,
      child: Text("wd"),
    ),
    SizedBox(width: 16.0), // Adjust the spacing between image and text

    // Text container (remaining three fourths of the width)
    Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(

          children: [
            Text("Graphic Design",style: theme.textTheme.titleSmall?.copyWith(color: Color(0xffFF6B00)),),
            Icon(Icons.favorite_border)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
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
    ),
    ],
    ),
    ),
        ],
      ),
    );
  }
}


