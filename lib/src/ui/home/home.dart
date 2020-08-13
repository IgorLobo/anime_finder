import 'package:anime_finder/src/ui/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Anime list",
      theme: ThemeData(primaryColor: Colors.purpleAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Anime list"),
        ),
        body: BlocProvider(
          create: (context) {
            final bloc = HomeBloc();
            bloc.add(AnimeFetch());
            return bloc;
          },
          child: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeInitial) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is HomeFailure) {
        return Center(
          child: Text('failed to fetch posts'),
        );
      }

      if (state is HomeSuccess) {
        return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            children: List.generate(
                state.animeList.length,
                (index) => Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                  child: Image(
                                image: NetworkImage(
                                    state.animeList[index].imageUrl),
                                fit: BoxFit.cover,
                              )),
                              Positioned.fill(
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashColor:
                                            Color.fromRGBO(255, 255, 255, 0.3),
                                        onTap: () => {},
                                      )))
                            ],
                          )),
                    )));
      }

      return Container();
    });
  }
}
