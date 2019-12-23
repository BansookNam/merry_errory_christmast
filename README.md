# **Merry_Errory_Christmast**

Showcase for Christmas.
Inspired by Error Pizza - [Paulo Bruckmann](https://www.facebook.com/paulo.bruckmann)[![img](https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/jC78Rnw2Q2h.png)](https://www.facebook.com/groups/425920117856409/badge_member_list/?badge_type=ACTIVE_MEMBER):
https://gist.github.com/peekpt/5be23b577e99856e2bbd223c6df69299?fbclid=IwAR26YC75s6lEDfF9mcCM02fwZOfQkqFnofKTiuBakIPSJ_uNJaTPw31ORlA



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