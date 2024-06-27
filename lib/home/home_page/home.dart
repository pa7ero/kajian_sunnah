import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajian_sunnah/home/home_page/bloc/home_bloc.dart';
import 'package:kajian_sunnah/service/ustadz_service.dart';
// import 'package:kajian_sunnah/home/home_page/bookmark.dart';
import 'package:kajian_sunnah/service/topik_service.dart';
import 'package:kajian_sunnah/service/category_service.dart';

class Home extends StatelessWidget {
  final TopikService topikService;
  final UstadzService ustadzService;
  final CategoryService categoryService;

  Home({
    required this.topikService,
    required this.ustadzService,
    required this.categoryService,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopikBloc(topikService)..add(FetchTopik()),
      child: BlocProvider(
        create: (context) => UstadzBloc(ustadzService)..add(FetchUstadz()),
        child: BlocProvider(
          create: (context) =>
              CategoryBloc(categoryService)..add(FetchCategory()),
          child: HomeView(),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 348,
                height: 210,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 190,
                            height: 80,
                            child: Text(
                              'Temukan Jadwal Kajian Dengan Mudah',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ProzaLibre_bold.ttf',
                                  color: Colors.white),
                            ),
                          ),
                          Image.asset(
                            'assets/images/Vector.png',
                            width: 140,
                            height: 96,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      height: 40,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            focusColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'apa yang ingin kamu cari ?'),
                        showCursor: true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              BlocBuilder<TopikBloc, TopikState>(
                builder: (context, state) {
                  if (state is TopikInitial) {
                    context.read<TopikBloc>().add(FetchTopik());
                    return Center(child: CircularProgressIndicator());
                  } else if (state is TopikLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is TopikLoaded) {
                    if (state.topik.isEmpty) {
                      print(
                          'HomeView: state.topik.length: ${state.topik.length}');
                      return Center(child: Text('Tidak ada topik'));
                    } else {
                      return SizedBox(
                        height: 30,
                        width: 600,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.topik.length,
                          itemBuilder: (context, index) {
                            final topik = state.topik[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 5),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    print(
                                        'ElevatedButton ditekan! ${topik.name}');
                                  },
                                  child: Text(
                                    topik.name ?? 'Nama Topik',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            );
                          },
                        ),
                      );
                    }
                  } else if (state is TopikError) {
                    return Center(
                        child: Text(state.message ??
                            'Terjadi Kesalahan yang tidak diketahui'));
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      '|',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Text(
                      '  Mengenal Ustadz',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ProzaLibre_bold.ttf',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<UstadzBloc, UstadzState>(
            builder: (context, state) {
              if (state is UstadzInitial) {
                context.read<UstadzBloc>().add(FetchUstadz());
                return Center(child: CircularProgressIndicator());
              } else if (state is UstadzLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is UstadzLoaded) {
                if (state.ustadz.isEmpty) {
                  print(
                      'HomeView: state.ustadz.length: ${state.ustadz.length}');
                  return Center(child: Text('Tidak ada ustadz'));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 600,
                      height: 300,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.ustadz.length,
                          itemBuilder: (context, index) {
                            final ustadz = state.ustadz[index];

                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                width: 150,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), // Warna shadow
                                      spreadRadius:
                                          2, // Seberapa menyebar shadow
                                      blurRadius: 5, // Tingkat blur shadow
                                      offset:
                                          Offset(0, 3), // Posisi shadow (x,y)
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.white, Colors.blue],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            stops: [0.0, 1.0],
                                            tileMode: TileMode.clamp),
                                        shape: BoxShape.circle,
                                        color: Colors.blueAccent,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                'URL_GAMBAR_ANDA')),
                                      ),
                                    ),
                                    Text(
                                      ustadz.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(ustadz.shortBio),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Lihat Profile'))
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                }
              } else if (state is UstadzError) {
                return Center(
                    child: Text(state.message ??
                        'Terjadi Kesalahan yang tidak diketahui'));
              } else {
                return Container();
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        '|',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Text(
                        '  Agenda',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'ProzaLibre_bold.ttf',
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Semua >',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryInitial) {
                context.read<CategoryBloc>().add(FetchCategory());
                return Center(child: CircularProgressIndicator());
              } else if (state is CategoryLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CategoryLoaded) {
                if (state.category.isEmpty) {
                  print(
                      'HomeView: state.category.length: ${state.category.length}');
                  return Center(child: Text('Tidak ada topik'));
                } else {
                  return SizedBox(
                      width: 600,
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.category.length,
                        itemBuilder: (context, index) {
                          final category = state.category[index];
                          return Container(
                            width: 180,
                            height: 250,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Warna shadow
                                  spreadRadius: 2, // Seberapa menyebar shadow
                                  blurRadius: 5, // Tingkat blur shadow
                                  offset: Offset(0, 3), // Posisi shadow (x,y)
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 180,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue),
                                ),
                                Text(
                                  category.parent,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Deskripsi/kutipan singkat'),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            IconButton(
                                                iconSize: 13,
                                                color: Colors.blueAccent,
                                                padding: EdgeInsets.all(3),
                                                constraints: BoxConstraints(
                                                  maxHeight: 30,
                                                  maxWidth: 30,
                                                ),
                                                onPressed: () {},
                                                icon: Icon(Icons.thumb_up)),
                                            Text(
                                              '768',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blueAccent),
                                            ),
                                            IconButton(
                                                iconSize: 15,
                                                padding: EdgeInsets.all(3),
                                                constraints: BoxConstraints(
                                                  maxHeight: 20,
                                                  maxWidth: 20,
                                                ),
                                                onPressed: () {},
                                                icon: Icon(Icons.bolt)),
                                            Text(
                                              '1K+',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          iconSize: 18,
                                          constraints: BoxConstraints(
                                            maxHeight: 30,
                                            maxWidth: 30,
                                          ),
                                          style: IconButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            backgroundColor:
                                                Colors.blueAccent[100],
                                            padding: EdgeInsets.all(2),
                                          ),
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.bookmark_outline,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ));
                }
              } else if (state is CategoryError) {
                return Center(
                    child: Text(state.message ??
                        'Terjadi Kesalahan yang tidak diketahui'));
              } else {
                return Container();
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
