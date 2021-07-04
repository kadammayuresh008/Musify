import 'package:flutter/material.dart';
import 'package:musify/Data/playlist.dart';
import 'package:musify/Screen/PlaylistSong.dart';

class Playhome extends StatefulWidget {
  const Playhome({Key key}) : super(key: key);

  @override
  _PlayhomeState createState() => _PlayhomeState();
}

class _PlayhomeState extends State<Playhome> {
  List dataResponse;
  List response;

  @override
  void initState() {
    super.initState();
    music_Data();
  }

  Future<void> music_Data() async {
    response = await DataProvide().get_data();
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
                  child: Text("My Playlists",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                      )),
                ),
                GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
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
                                      playlist: dataResponse, index: index)),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        dataResponse[index]["playlistimg"]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(dataResponse[index]["playlistname"],
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
