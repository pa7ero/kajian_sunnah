import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajian_sunnah/home/home_page/bloc/home_bloc.dart';
import 'package:kajian_sunnah/service/topik_service.dart';

class Home extends StatelessWidget {
  final TopikService topikService;

  Home({required this.topikService});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopikBloc(topikService),
      child: HomeView(),
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.grid_view,
        ),
        title: Text(
          'Kajian Sunnah',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontFamily: 'ProzaLibre-Bold',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
              ),
            ),
          ),
        ],
      ),
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
                    return ListView.builder(
                      itemCount: state.topik.length,
                      itemBuilder: (context, index) {
                        final topik = state.topik[index];
                        return ListTile(
                          title: Text(topik.name),
                        );
                      },
                    );
                  } else if (state is TopikError) {
                    return Center(child: Text(state.message));
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 25,
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
                    Text(' '),
                    Text(
                      'Mengenal Ustadz',
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
          Container(
            width: 600,
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 5),
                Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '|',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          Text(' '),
          Text(
            'Agenda',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'ProzaLibre_bold.ttf',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 600,
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 5),
                Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(onPressed: () {}, child: Text('topik')),
                ),
                SizedBox(width: 5),
                Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
          Container(
            width: 300,
            height: 200,
            color: Colors.amber,
          ),
          Container(
            width: 300,
            height: 200,
            color: Colors.blue,
          ),
          Container(
            width: 300,
            height: 200,
            color: Colors.green,
          ),
          Container(
            width: 300,
            height: 200,
            color: Colors.black,
          ),
          Container(
            width: 300,
            height: 200,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
