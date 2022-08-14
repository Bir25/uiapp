import 'package:appflut/api.dart';
import 'package:appflut/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';






class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      toolbarHeight: 200,
      flexibleSpace: Image.asset('assets/images/movie.png', fit: BoxFit.fill,),
    ),
        body:Consumer(
          builder: (context, ref, child) {
            final movieState = ref.watch(movieProvider);
            return Column(
              children: [
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10,
                                horizontal: 10),
                            hintText: 'search movie',
                            border: OutlineInputBorder(),
                            // suffixIcon: Icon(Icons.add_a_photo_outlined)
                        ),
                      ),
                    )),
                    PopupMenuButton(
                        padding: EdgeInsets.only(top: 15),
                        icon: Icon(Icons.menu, size: 30,),
                        onSelected: (val) {
                          print(val);
                        },
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                                value: Api.popularMovieUrl,
                                child: Text('popular')),
                            PopupMenuItem(
                                value: Api.upComingMovieUrl,
                                child: Text('upcoming')),
                            PopupMenuItem(
                                value: Api.topRatedMovieUrl,
                                child: Text('top_rated'))
                          ];
                        }
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                    height: 440,
                    child: movieState.movies.isEmpty ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ): GridView.builder
                      (
                        itemCount: movieState.movies.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2/3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5
                        ),
                        itemBuilder: (context, index){
                          final movie = movieState.movies[index];
                          return Image.network('https://image.tmdb.org/t/p/w600_h900_bestv2/${movie.poster_path}');
                        }),
                )
              ],
            );
          }
        )
    );
  }
}
