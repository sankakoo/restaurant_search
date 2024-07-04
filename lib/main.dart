import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationPanel(),
          Expanded(
            child: RestaurantSearchPage(),
          ),
        ],
      ),
    );
  }
}

class NavigationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      color: Colors.grey[200],
      child: Column(
        children: [
          Icon(Icons.restaurant),
          Icon(Icons.search),
          Icon(Icons.star),
          Icon(Icons.settings),
          Spacer(),
          Icon(Icons.add),
        ],
      ),
    );
  }
}

class RestaurantSearchPage extends StatelessWidget {
  void buttonClick() {
    print('Button clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover top restaurants',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter city',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width:
                      8), // Add some space between the text field and the button
              ElevatedButton(
                onPressed: () {
                  buttonClick();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green, // Set the background color to green
                ),
                child: Text('Search'),
              ),
            ],
          ),
          SizedBox(height: 16),
          TopSearches(),
          SizedBox(height: 16),
          Categories(),
          SizedBox(height: 16),
          RatingAndPrice(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class TopSearches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> searches = [
      'Italian',
      'Asian',
      'Mexican',
      'French',
      'Seafood',
      'Vegetarian',
      'Vegan',
    ];

    return Wrap(
      spacing: 8.0,
      children: searches.map((search) {
        return Chip(
          label: Text(search),
        );
      }).toList(),
    );
  }
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: [
        CategoryChip(label: 'Rating'),
        CategoryChip(label: 'Reviews'),
        CategoryChip(label: 'Menu'),
        CategoryChip(label: 'Location'),
        CategoryChip(label: 'Photos'),
      ],
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: true,
      onSelected: (bool selected) {},
    );
  }
}

class RatingAndPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rating'),
        Row(
          children: List.generate(5, (index) {
            return Icon(Icons.star, color: Colors.black);
          }),
        ),
        SizedBox(height: 16),
        Text('Price'),
        Wrap(
          spacing: 8.0,
          children: [
            CategoryChip(label: 'Popular'),
            CategoryChip(label: 'Recommend'),
            CategoryChip(label: 'Featured'),
          ],
        ),
      ],
    );
  }
}
