import 'package:flutter/material.dart';

class ArtistDataProvider {
  List<dynamic> artists = [
    {
      "artistname": "Calum Scott",
      "id": 1,
      "artistimg": "assets/musicimages/artist1.jpg",
      "songs": [
        {
          "key": 1,
          "name": "You Are The Reason",
          "musicUrl": "songs/You Are The Reason.mp3",
          "musicImage": "assets/musicimages/you are the reason.jpg",
          "artist": ['Calum Scott']
        }
      ]
    },
    {
      "artistname": "Martin Garrix",
      "id": 2,
      "artistimg": "assets/musicimages/artist2.jpg",
      "songs": [
        {
          "key": 1,
          "name": "There For You",
          "musicUrl": "songs/There For You.mp3",
          "musicImage": "assets/musicimages/there for you.jpg",
          "artist": ['Martix Garrix & Troy Sivan']
        }
      ]
    },
    {
      "artistname": "Bruno Mars",
      "id": 3,
      "artistimg": "assets/musicimages/artist3.jpg",
      "songs": [
        {
          "key": 9,
          "name": "Just The Way You Are",
          "musicUrl": "songs/Just The Way You Are.mp3",
          "musicImage": "assets/musicimages/just the way you are.jpg",
          "artist": ['Bruno Mars']
        },
        {
          "key": 12,
          "name": "Talking to the Moon",
          "musicUrl": "songs/Talking to the Moon.mp3",
          "musicImage": "assets/musicimages/talking to the moon.jpg",
          "artist": ['Bruno Mars']
        }
      ]
    },
    {
      "artistname": "Charlie Puth",
      "id": 4,
      "artistimg": "assets/musicimages/artist4.jpg",
      "songs": [
        {
          "key": 1,
          "name": "Dangerously",
          "musicUrl": "songs/Dangerously.mp3",
          "musicImage": "assets/musicimages/dangerously.jpg",
          "artist": ['Charlie Puth']
        },
        {
          "key": 2,
          "name": "Attention",
          "musicUrl": "songs/Attention.mp3",
          "musicImage": "assets/musicimages/attention.jpg",
          "artist": ['Charlie Puth']
        }
      ]
    },
    {
      "artistname": "Selena Gomez",
      "id": 5,
      "artistimg": "assets/musicimages/artist5.jpg",
      "songs": [
        {
          "key": 8,
          "name": "It Ain't Me",
          "musicUrl": "songs/It Ain't Me.mp3",
          "musicImage": "assets/musicimages/it aint me.jpg",
          "artist": ['Kygo, Selena Gomez']
        }
      ]
    },
    {
      "artistname": "Public",
      "id": 6,
      "artistimg": "assets/musicimages/artist6.jpg",
      "songs": [
        {
          "key": 11,
          "name": "Make You Mine",
          "musicUrl": "songs/Make You Mine.mp3",
          "musicImage": "assets/musicimages/make you mine.jpg",
          "artist": ['Public']
        }
      ]
    },
    {
      "artistname": "Kodaline",
      "id": 7,
      "artistimg": "assets/musicimages/artist7.jpg",
      "songs": [
        {
          "key": 1,
          "name": "All I Want",
          "musicUrl": "songs/All I Want.mp3",
          "musicImage": "assets/musicimages/All i want.jpg",
          "artist": ['Kodaline']
        }
      ]
    },
    {
      "artistname": "Juice Wrld",
      "id": 8,
      "artistimg": "assets/musicimages/artist8.jpg",
      "songs": [
        {
          "key": 1,
          "name": "Lucid Dreams",
          "musicUrl": "songs/Lucid Dreams.mp3",
          "musicImage": "assets/musicimages/lucid dreams.jpg",
          "artist": ['Juice Wrld']
        }
      ]
    },
  ];

  get_data_artist() {
    return artists;
  }
}
