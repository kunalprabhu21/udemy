import 'package:flutter/material.dart';
import 'package:udemy/screens/searchResults/search_results.dart';

import '../theme/screen_util.dart';
import '../theme/theme_helper.dart';
import 'Home.dart';



class SearchView extends StatelessWidget {
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
               Text('Search',style: theme.textTheme.headlineSmall,),

            ],
          ),
          SizedBox(height: 10,),
          CustomSearchView(
            onChanged: (query){
              setState(() {
                searchQuery = query;
                suggestions = query.isNotEmpty ? fetchSuggestions(query): [];
              });
            },
            autofocus: false,
            controller: searchController,
            hintText: "Search for..",
            suffix: Icon(Icons.search_sharp,color: Colors.white,),
            prefix: Icon(Icons.search_sharp,color: Colors.black,),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(suggestions[index],style: CustomTextStyles.mulishBold15,),
                  onTap: () {
                    // Handle when a suggestion is tapped
                    print('Tapped on: ${suggestions[index]}');
                    searchController.text = suggestions[index];
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchViewResults()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Simulated backend logic for fetching suggestions
  List<String> fetchSuggestions(String query) {
    return [
      '3D Design',
      'Graphic Design',
      'Programming',
      'SEO & Marketing',
      'Web Development',
    ].where((suggestion) =>
        suggestion.toLowerCase().contains(query.toLowerCase())).toList();
  }
}

class CustomSearchBox extends StatelessWidget {
  final Function(String) onSubmitted;
  final Function(String) onChanged;

  CustomSearchBox({
    required this.onSubmitted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: 'Search for restaurants...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
