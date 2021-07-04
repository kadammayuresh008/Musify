import 'package:flutter/material.dart';
import 'package:musify/Data/artist.dart';
import 'package:musify/Screen/PlaylistSong.dart';

class ArtistList extends StatefulWidget {
  const ArtistList({Key key}) : super(key: key);

  @override
  _ArtistListState createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  List dataResponse;
  List<dynamic> response;

  @override
  void initState() {
    super.initState();
    music_Data();
  }

  Future<void> music_Data() async {
    response = await ArtistDataProvider().get_data_artist();
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
                  child: Text("Artist",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontFamily: "DancingScript",
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
                                        dataResponse[index]["artistimg"]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(dataResponse[index]["artistname"],
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
