import 'package:flutter/material.dart';
import 'package:movie_website/data/movie_data.dart';
import 'package:movie_website/model/movie_model.dart';
import 'package:movie_website/skeleton_loading/carousel_skeleton.dart';
import 'package:movie_website/skeleton_loading/now_skeleton.dart';
import 'package:movie_website/skeleton_loading/popular_skeleton.dart';
import 'package:movie_website/widget/icon_searchbar.dart';
import 'package:movie_website/widget/main_drawer.dart';
import 'package:movie_website/widget/main_footer.dart';
import 'package:movie_website/widget/main_widget/main_carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> _toprateMovie = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getMovieData();
    });
  }

  getMovieData() async {
    var data = MovieData();
    try {
      _toprateMovie = await data.fetchTopRatedMovie();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("\n===========================\n");
      print("API failed");
      print("\n===========================\n");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IconSearchbar(),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Top rated movies",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: isLoading
                        ? CarouselSkeleton()
                        : MainCarouselSlider(topratedMovies: _toprateMovie),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          "Now playing",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      NowSkeleton(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Explore popular movies",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double gridviewHeight = (constraints.maxWidth / 5) * 1.3 * 4;
                  return SizedBox(
                    height: gridviewHeight,
                    child: const PopularSkeleton(),
                  );
                },
              ),
            ),
            const MainFooter(),
          ],
        ),
      ),
    );
  }
}
