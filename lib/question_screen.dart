import 'package:flutter/material.dart';
import 'package:fluttery_audio/fluttery_audio.dart';
import 'package:video_player/video_player.dart';
import 'RadialProgress/pointer.dart';

class QuestionScreenState extends StatefulWidget{
  QuestionScreen createState() => QuestionScreen();
}
class QuestionScreen extends State<QuestionScreenState>{
  VideoPlayerController _videoController;
  
  getVideo(url){
    setState(() {
      _videoController = VideoPlayerController.network(
          // url
          'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
        ..initialize().then((_) {
          setState(() {});
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    // method answer contain answer and category
    answer(answer, category){
      switch (category){
        case "text" :
          return Text(answer);
          break;
        case "image" :
          // return Image.network(answer);
          return Image.asset("images/person.png");
        case "audio" :
          return Audio(
            // audioUrl: answer,
            audioUrl: "https://api.soundcloud.com/tracks/260578593/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P",
            playerBuilder: (BuildContext context, AudioPlayer player, Widget child) {
              // player.loadMedia(Uri.parse(answer));
              player.loadMedia(Uri.parse("https://api.soundcloud.com/tracks/260578593/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P"));
              player.play();
          });
          break;
        case "video" :
          getVideo(answer);
          if(_videoController.value.initialized){
            return AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            );
          }else{
            Container();
          }
          break;
        default :
          return Container();
          break;
      }
      return Container();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          // width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 170,
                  // alignment: Alignment.center,
                  color: Colors.purple,
                  child: Row(
                    children: <Widget>[
                      Image.asset("images/person.png",width: 60,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20,0,0,0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("User-Name",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            )),
                            Text("User-points",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            )),
                          ],
                        ),
                      ),
                      //Image for question number and a circle 
                      Expanded(
                        child: HomeContent(),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 0,
                right: 0,
                bottom: 20,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Card(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text("Soccer"),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text("Points"),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Question: sfsdfdsf dsf dsf ds fds ds f dsf dsf",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Expanded(
                       GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        childAspectRatio: 2,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(4,(index) => Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Card(
                              margin: EdgeInsets.all(10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2,color: Colors.green),
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                alignment: Alignment.center,
                                // child: Text("data"),
                                child: answer("data", "text"),
                              ),
                            ),
                             Positioned(
                              right: 10,
                              top: 10,
                              child: Container(
                                child: Icon(Icons.check_circle,color: Colors.green),
                              ),
                            ),
                          ],
                        ))
                      )
                    // )
                  ],
                )
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          alignment: Alignment.center,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                top: 20,
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  color: Colors.purple,
                  alignment: Alignment.center
                ),
              ),
              Positioned( 
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20,0,20,0),
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.cached,size: 45,color: Colors.white),
                            Text("Change Question",
                              style: TextStyle(
                                color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                          border: Border(left: BorderSide(width: 2,color: Colors.purple[800]),right: BorderSide(width: 2,color: Colors.purple[800])),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.school,size: 45,color: Colors.white),
                            Text("Remove One",
                              style: TextStyle(
                                color: Colors.white,
                            )),
                          ],
                        ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.schedule,size: 45,color: Colors.white),
                            Text("sesdsd",
                              style: TextStyle(
                                color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}