import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News",
              style: TextStyle(color: Colors.black),
              ),
              Text(
                "Cloud",
                style: TextStyle(color: Colors.orange),
              ),
          ],
        ),
        
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 32,
              ),
            )
          ],
        ),
        ),
      );}}