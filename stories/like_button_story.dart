import 'package:dashbook/dashbook.dart';
import 'package:my_pixels/widgets/like_button.dart';

void addStories(Dashbook dashbook) {
  dashbook
      .storiesOf('LikeButton')
      .add(
          'default',
          (_) => LikeButton(
              width: 50,
              height: 50,
              onChange: (value) {
                print(value);
              }))
      .add('selected', (_) => LikeButton(selected: true, width: 50, height: 50))
      .add(
          'custom size',
          (ctx) => LikeButton(
              selected: true,
              width: ctx.numberProperty('width', 200),
              height: ctx.numberProperty('height', 200)));
}
