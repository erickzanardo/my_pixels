import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String commentAssetName = 'assets/images/comment.svg';
final String likesAssetName = 'assets/images/like.svg';
final String authorAssetName = 'assets/images/author.svg';

final Widget authorAsset = SvgPicture.asset(
    authorAssetName,
    semanticsLabel: 'Author name'
);

final Widget commentAsset = SvgPicture.asset(
    commentAssetName,
    semanticsLabel: 'comments'
);

final Widget likeAsset = SvgPicture.asset(
    likesAssetName,
    semanticsLabel: 'likes'
);

class AuthorInsights extends StatelessWidget {
  final String authorName;
  final int likesCount;
  final int commentsCount;

  AuthorInsights({@required this.authorName, this.likesCount = 0, this.commentsCount = 0});

  @override
  Widget build(BuildContext context) {
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
}
