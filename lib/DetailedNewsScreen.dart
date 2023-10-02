// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailedNewsScreen extends StatefulWidget {
  final String? title;
  final String? imageUrl;
  final String? id;

  const DetailedNewsScreen(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.id});

  @override
  State<DetailedNewsScreen> createState() => _DetailedScreen();
}

class _DetailedScreen extends State<DetailedNewsScreen> {
  final ScrollController _scrollController = ScrollController();
  double _containerPosition = 0.0;

  bool _isFavorite = false;

  void _checkFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedIds = prefs.getStringList('favoriteIds') ?? [];
    if(savedIds.contains(widget.id)){
      setState(() {
        _isFavorite = true ;
      });
    }
  }

  void _toggleFavorite() async {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    final prefs = await SharedPreferences.getInstance();
    List<String>? savedIds = prefs.getStringList('favoriteIds') ?? [];

    if (_isFavorite) {
      savedIds.add(widget.id ?? '');
    } else {
      savedIds.remove(widget.id ?? '');
    }

    await prefs.setStringList('favoriteIds', savedIds);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    _checkFavorite();
  }

  void _handleScroll() {
    setState(() {
      _containerPosition = (_scrollController.offset / 2)
          .clamp(0.0, 100.0); // Adjust the range as needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.all(16),
                  title: AnimatedDefaultTextStyle(
                      duration: const Duration(microseconds: 500),
                      style: TextStyle(
                          fontSize: _containerPosition > 0.0 ? 20 : 16,
                          fontWeight: FontWeight.bold),
                      child: Text(widget.title ?? '')),
                  background: Image.network(
                    widget.imageUrl ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                leading: Container(), // Remove the back arrow
                backgroundColor: Colors.black,
              ),
              SliverToBoxAdapter(
                child: Container(
                    transform: Matrix4.translationValues(
                        0.0, -_containerPosition, 0.0),
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.The SliverStack() allows putting one sliver on another. In the below example, through SliverPositioned() we are creating the complete layout of yellow color on top of which we are rendering list items using SliverList(). SliverList() takes a delegate as a parameter to give the items to the list to be scrolled.',
                        style: TextStyle(fontSize: 16),
                      ),
                    )),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Transform.scale(
            scale: 1.5,
            child: SizedBox(
              width: 40,
              height: 40,
              child: FloatingActionButton(
                onPressed: _toggleFavorite,
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                child: Icon(
                  _isFavorite ? Icons.star : Icons.star_border,
                  color: Colors.yellow,
                  size: 30,
                ),
              ),
            )));
  }
}
