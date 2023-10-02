import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subspacenewsapp/NewsHeading.dart';
import 'package:subspacenewsapp/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Post',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> blogPosts = [];

  void fetchBlogs() async {
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

        final prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        // print('Response data: ${response.body}');
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> data = responseData['blogs'];
        setState(() {
          blogPosts = data.cast<Map<String, dynamic>>();
        });
        final jsonBlogPosts = jsonEncode(blogPosts);
      await prefs.setString('blogPosts', jsonBlogPosts);
      } else {
        // Request failed
        // print('Request failed with status code: ${response.statusCode}');
        // print('Response data: ${response.body}');
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      // print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // print('Before fetch');
    fetchBlogs();
    // print('after fetch');
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    fetchBlogs(); // Run the function whenever the widget is rebuilt
  }

  bool isSearchExpanded = false;
  TextEditingController searchController = TextEditingController();

  void filterList(String query) {
    List<Map<String, dynamic>> filteredList = [];

    if (query.isEmpty) {
      // If the query is empty, show all items
      filteredList = blogPosts;
    } else {
      // Otherwise, filter items based on the query
      filteredList = blogPosts
          .where((item) =>
              item['title']?.toLowerCase().contains(query.toLowerCase()) ??
              false)
          .toList();
    }

    setState(() {
      // Update the list to display the filtered items
      blogPosts = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.home,
            size: 30,
          ),
          title: isSearchExpanded
              ? TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    filterList(value);
                  },
                  autofocus: true,
                )
              : const Text('All blogs'),
          centerTitle: true,
          actions: [
            IconButton(
              icon:
                  Icon(isSearchExpanded ? Icons.clear : Icons.search, size: 30),
              onPressed: () {
                setState(() {
                  isSearchExpanded = !isSearchExpanded;
                  if (!isSearchExpanded) {
                    // Clear the search field and handle search icon tap
                    searchController.clear();
                    // Handle search icon tap
                  }
                });
              },
            ),
          ],
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ListView.builder(
                    itemCount: blogPosts.length,
                    itemBuilder: (context, index) {
                      final news = blogPosts[index];
                      final imageUrl = news["image_url"];
                      final title = news["title"];
                      final id = news["id"];
                      if (imageUrl == null || title == null) {
                        // Handle the case where imageUrl or title is null
                        return const SizedBox(); // Return an empty SizedBox or any other appropriate widget
                      }
                      return NewsHeading(
                          heading: title, imageUrl: imageUrl, id: id);
                    }))));
  }
}
