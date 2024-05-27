import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Browse Categories'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Not sure about exactly which recipe you\'re looking for? Do a search, or dive into our most popular categories.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            categorySection('BY MEAT', [
              {'name': 'Beef', 'image': 'images/beef.jpg'},
              {'name': 'Chicken', 'image': 'images/chicken.jpg'},
              {'name': 'Pork', 'image': 'images/pork.jpg'},
              {'name': 'Seafood', 'image': 'images/seafood.jpg'},
            ]),
            categorySectionWithTextOverlay('BY COURSE', [
              {'name': 'Main Dishes', 'image': 'images/main dishes.jpg'},
              {'name': 'Salad Recipes', 'image': 'images/salad.jpg'},
              {'name': 'Side Dishes', 'image': 'images/Side Dishes.jpg'},
              {'name': 'Crackpot', 'image': 'images/Crackpot.jpg'},
            ]),
            categorySectionWithTextOverlay('BY DESSERT', [
              {'name': 'Ice Cream', 'image': 'images/dessert1.jpg'},
              {'name': 'cake', 'image': 'images/dessert2.jpg'},
              {'name': 'Cookies', 'image': 'images/dessert3.jpg'},
              {'name': 'chess_cake', 'image': 'images/dessert6.jpeg'},
            ]),
          ],
        ),
      ),
    );
  }

  Widget categorySection(String title, List<Map<String, String>> items) {
    return commonCategorySection(title, items, false);
  }

  Widget categorySectionWithTextOverlay(String title, List<Map<String, String>> items) {
    return commonCategorySection(title, items, true);
  }

  Widget commonCategorySection(String title, List<Map<String, String>> items, bool useStack) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 40,
              mainAxisSpacing: 20,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return useStack ? imageWithTextOverlay(items[index]) : imageOnly(items[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget imageWithTextOverlay(Map<String, String> item) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item['image']!),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(80),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        color: Colors.black.withOpacity(0.1),
        child: Text(
          item['name']!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget imageOnly(Map<String, String> item) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(item['image']!),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(81),
      ),
      alignment: Alignment.center,
      child: Text(
        item['name']!,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          shadows: [
            Shadow(
              blurRadius: 15,
              offset: Offset(0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
