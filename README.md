# christmas_tree

Flutter Error Widget Can be Replaced with Custom Widgets.

Showcase for Christmas.

Basically you can replace errorWidget.
Recommend to replace the horrible red error stacktrace widget with code below.

```
 ErrorWidget.builder = (errorDetails) {
                        return Center(
                          child: Container(
                              color: Colors.white,
                        );
                      };
```



Demo:
![tree_demo](./gif/tree_demo.gif)