import 'package:flutter/material.dart';

class APPAvatar extends StatelessWidget {
  final double radius;
  final String? url;
  final String? name;
  const APPAvatar({Key? key, this.radius = 60, required this.name, this.url})
      : super(key: key);
  String getInitials(name) {
    try {
      List<String> names = name.split(" ");
      String initials = "";

      for (var i = 0; i < 2 && i < names.length; i++) {
        initials += names[i][0];
      }
      return initials;
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return url != null
        ? CircleAvatar(
            backgroundImage: NetworkImage(
                // url!,
                url!),
            radius: radius,
          )
        : CircleAvatar(
            radius: radius,

            child: FittedBox(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(child: Text(getInitials(name).toUpperCase())),
            )),
            // radius: radius,
          );
  }
}
