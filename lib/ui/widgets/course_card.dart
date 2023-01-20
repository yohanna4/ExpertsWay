import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:learncoding/models/course.dart';
import 'package:learncoding/utils/color.dart';
import 'card.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CourseCard extends StatefulWidget {
  CourseElement courseElement;
  int index;
  CourseCard({required this.courseElement, required this.index, super.key});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 10, 30),
      child: CardWidget(
        gradient: false,
        button: true,
        duration: 200,
        border: tab == widget.index
            ? Border(
                bottom: BorderSide(
                    // color: Colors.green,
                    color: colorConvert(
                      widget.courseElement.color,
                    ),
                    width: 5),
              )
            : null,
        child: Center(
          child: Column(
            mainAxisAlignment: material.MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 30,
                height: 30,
                child: CachedNetworkImage(
                  imageUrl: widget.courseElement.icon,
                  placeholder: (context, url) => CircularProgressIndicator(color: maincolor,),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Text(widget.courseElement.name)
            ],
          ),
        ),
        func: () {
          setState(() {
            tab = widget.index;
          });
        },
      ),
    );
  }

  Color colorConvert(String color) {
    color = color.replaceAll("#", "");
    if (color.length == 6) {
      return Color(int.parse("0xFF$color"));
    } else if (color.length == 8) {
      return Color(int.parse("0x$color"));
    } else {
      return const Color.fromARGB(0, 247, 86, 0);
    }
  }
}
