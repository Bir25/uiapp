import 'package:appflut/api.dart';
import 'package:appflut/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';






class HomePage extends StatelessWidget {
final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
      toolbarHeight: 160,
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
                        controller: searchController,
                        onFieldSubmitted: (val){

                          ref.read(movieProvider.notifier).searchMovie(searchText: val.trim());
                       searchController.clear();
                        },
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
                         ref.read(movieProvider.notifier).changeCategory(apiPath: val as String);
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
                    ): movieState.movies[0].title == 'no-data' ? Center(
                      child: Column(
                        children: [
                          Text('try using other keyword'),
                          ElevatedButton(onPressed: (){
                            ref.refresh(movieProvider.notifier);
            }, child: Text('reload'))
                        ],
                      ),
                    ):Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder
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
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  errorWidget: (c, s, d){
                                    return Image.asset('assets/images/movie.png');
                                  },
                                  imageUrl: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/${movie.poster_path}',));
                          }),
                    ),
                )
              ],
            );
          }
        )
    );
  }
}
