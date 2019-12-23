# christmas_tree

Showcase for Christmas.


**Flutter error widget can be replaced with Custom Widgets.**

Basically you can replace errorWidget.
**Recommend** to replace the horrible red error stacktrace widget with code below.

```dart
 ErrorWidget.builder = (errorDetails) {
                        return Center(
                          child: Container(
                              color: Colors.white,
                        );
                      };
```


Demo:

![tree_demo](./gif/tree_demo.gif)