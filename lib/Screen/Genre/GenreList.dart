import 'package:flutter/material.dart';
import 'package:musify/Screen/PlaylistSong.dart';
import 'package:musify/Data/Genre.dart';

class GenreList extends StatefulWidget {
  const GenreList({Key key}) : super(key: key);

  @override
  _GenreListState createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  List dataResponse;
  List<dynamic> response;

  @override
  void initState() {
    super.initState();
    music_Data();
  }

  Future<void> music_Data() async {
    response = await GenreDataProvide().get_data_genre();
    setState(() {
      dataResponse = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return dataResponse == null
        ? CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            backgroundColor: Colors.green,
          )
        : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Text("Genres",
                      style: TextStyle(
                        fontFamily: "DancingScript",
                        color: Colors.white,
                        fontSize: 35.0,
                      )),
                ),
                GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    shrinkWrap: true,
                    children: List.generate(dataResponse.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaylistSong(
                                      playlist: dataResponse, index: index),
                                ));
                          },
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        dataResponse[index]["genreimg"]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(dataResponse[index]["genrename"],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
              ],
            ),
          );
  }
}
