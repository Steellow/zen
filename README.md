# zen_app

Mobile app for meditation. You can set min and max time, and when you start meditating the app randomly picks a time for you between those values. The point is to... I'm not even sure I just though it'd be cool to have a little variance each time.

## Hive

All data is stored with [Hive](https://pub.dev/packages/hive), in multiple different boxes. Check `hive_helper.dart` for more info.

## Pictures

All pictures are from [unDraw](https://undraw.co/) or [manypixels](https://www.manypixels.co/gallery). All of the unDraw pictures are modified. You can find the original `.svg` files and and `.psd` files inside `/assets-original` directory. Finished edited pictures are inside `/assets` directory.

| Location             | Source     | Picture name    | Modifications                       |
| -------------------- | ---------- | --------------- | ----------------------------------- |
| Intro screen, page 1 | unDraw     | Fall            | String color changed, image cropped |
| Intro screen, page 2 | unDraw     | Time Management | Girl removed from the picture       |
| Intro screen, page 3 | unDraw     | Accept Terms    | Girl removed from the picture       |
| Home screen          | manypixels | Meditation      | None                                |

### Icon

Icon was made with [Android Asset Studio](https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html#foreground.type=text&foreground.text.text=z&foreground.text.font=Roboto&foreground.space.trim=1&foreground.space.pad=0.5&foreColor=rgb(255%2C%20255%2C%20255)&backColor=rgb(100%2C%20181%2C%20246)&crop=0&backgroundShape=circle&effects=elevate&name=ic_launcher). Original files can be found from `/assets-original/ic_launcher/`.