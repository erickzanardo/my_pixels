import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../common/colors.dart';
import '../../services/pixel_service.dart';
import '../../models/pixel.dart';
import '../../models/comment.dart';
import '../../widgets/comment/comment_list.dart';

const containerMargin = EdgeInsets.only(left: 10, right: 10, top: 13, bottom: 13);

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 480,
        margin: containerMargin,
        color: Colors.detailBackground,
        child: FutureBuilder(
            future: PixelService.fetchPixel(),
            builder: (BuildContext context, AsyncSnapshot<PixelModel> snapshot) {
              if (snapshot.hasData) {
                return Column(
                    children: [
                      _pixelDateTime(snapshot.data.createdAt),
                      _picture(snapshot.data.url),
                      _authorAndInsights(snapshot.data.author, likesCount: snapshot.data.likes, commentsCount: snapshot.data.comments.length),
                      _comments(snapshot.data.comments)
                    ]
                );
              } else if (snapshot.hasError) {
                return Text("Somethis is wrong");
              } else {
                return Text("Loading");
              }
            }
        )
    );
  }
}

Widget _pixelDateTime(DateTime dateTime) {
  String dateFormat = DateFormat.yMMMMEEEEd().format(dateTime).toString();
  return Row(
      children: [
        Container(
            margin: EdgeInsets.all(5),
            child: Text(dateFormat, textAlign: TextAlign.left)
        )
      ]
  );
}

  Widget _picture(String url) {
    return Center(
      child: Container(
          width: 400,
          height: 260,
          child: Image.network(
            url,
            fit: BoxFit.fitWidth,
            filterQuality: FilterQuality.none,
          )),
    );
  }

  Widget _comments(List<Comment> comments) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CommentList(
        comments: comments,
        initialVisibleComments: 3,
        incrementVisibleCount: 2,
        enableComment: false,
      ),
    );
  }


  final String commentAssetName = 'assets/images/comment.svg';
  final String likesAssetName = 'assets/images/like.svg';
  final String authorAssetName = 'assets/images/author.svg';

  final Widget authorAsset = SvgPicture.asset(
    authorAssetName,
    semanticsLabel: 'erick'
  );

  final Widget commentAsset = SvgPicture.asset(
    commentAssetName,
    semanticsLabel: 'comments'
  );

  final Widget likeAsset = SvgPicture.asset(
    likesAssetName,
    semanticsLabel: 'likes'
  );

  Widget _authorAndInsights(String authorName, {int likesCount = 50, int commentsCount = 0}) {
    return Container(
        padding: EdgeInsets.all(5),
        height: 60,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        child: authorAsset,
                    ),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                            children: [
                              Row(
                                  children:[
                                    Text(authorName, style: TextStyle(fontWeight: FontWeight.bold))
                                  ]
                              ),
                              Row(
                                  children:[Text("Campinas SP")]
                              )
                            ]
                        )
                    )
                  ]
              ),
              Row(
                  children: [
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                            children:[
                              Row(
                                  children:[
                                    commentAsset,
                                  ]
                              ),
                              Row(
                                  children:[
                                    Text(commentsCount.toString())
                                  ]
                              )
                            ]
                        ),
                    ),
                    Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                            children:[
                              Row(
                                  children:[
                                    likeAsset,
                                  ]
                              ),
                              Row(
                                  children:[
                                    Text(likesCount.toString())
                                  ]
                              )
                            ]
                        )
                    )
                  ]
              ),
            ]
        )
    );
  }
