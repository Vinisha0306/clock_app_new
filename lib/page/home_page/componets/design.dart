import 'package:clock_app/heders.dart';

Widget Design(
    {required size,
    required min,
    required second,
    required colorFirst,
    required colorSecond,
    required boolvalue,
    required d,
    timerHour,
    timerMinute,
    timerSecond}) {
  return Expanded(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width * 0.75,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white70,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1, 1),
                blurRadius: 6,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-5, -5),
                blurRadius: 10,
              )
            ],
          ),
        ),
        ...List.generate(
          60,
          (index) => Transform.rotate(
            angle: index * (pi * 2) / 60,
            child: SizedBox(
              width: size.width * 0.75,
              child: Divider(
                endIndent: 8,
                indent: index % 5 == 0 ? size.width * 0.69 : size.width * 0.7,
                color: index % 5 == 0 ? colorSecond : Colors.black,
                thickness: index % 5 == 0 ? 3 : 1,
              ),
            ),
          ),
        ),
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorFirst,
                colorSecond,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: colorSecond,
                blurRadius: 8,
                offset: Offset(0, 5),
              ),
            ],
          ),
        ),
        Container(
          width: 230,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        //hour
        Visibility(
          visible: boolvalue == "clockButton" ? true : false,
          child: Transform.rotate(
            angle: pi / 2,
            child: Transform.rotate(
              angle: d.hour * (pi * 2) / 12,
              alignment: Alignment.center,
              child: Divider(
                indent: size.height / 8,
                endIndent: size.width / 2 - 16,
                thickness: 4,
                color: colorFirst,
              ),
            ),
          ),
        ),

        //min
        Visibility(
          visible: boolvalue == "clockButton" ? true : false,
          child: Transform.rotate(
            angle: pi / 2,
            child: Transform.rotate(
              angle: d.minute * (pi * 2) / 60,
              alignment: Alignment.center,
              child: Divider(
                indent: 87,
                endIndent: size.width / 2 - 16,
                thickness: 2.5,
                color: colorSecond,
              ),
            ),
          ),
        ),

        // sec
        Visibility(
          visible: boolvalue == "clockButton" ? true : false,
          child: Transform.rotate(
            angle: pi / 2,
            child: Transform.rotate(
              angle: d.second * (pi * 2) / 60,
              alignment: Alignment.center,
              child: Divider(
                indent: 67,
                endIndent: size.width / 2 - 16,
                thickness: 2,
                color: Colors.red,
              ),
            ),
          ),
        ),

        Visibility(
          visible: boolvalue == "stopWatchButton" ? true : false,
          child: Text(
            "${min.toString().padLeft(2, '0')} : ${second.toString().padLeft(2, '0')}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
        Visibility(
          visible: boolvalue == "timerButton" ? true : false,
          child: Text(
            "${timerHour.toString().padLeft(2, '0')} : ${timerMinute.toString().padLeft(2, '0')} : ${timerSecond.toString().padLeft(2, '0')}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
      ],
    ),
  );
}
