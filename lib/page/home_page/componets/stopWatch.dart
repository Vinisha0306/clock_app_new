import 'package:clock_app/heders.dart';
import 'package:clock_app/page/home_page/componets/button.dart';
import 'package:clock_app/page/home_page/componets/design.dart';

Widget stopWatch({
  required size,
  required timer,
  required min,
  required second,
  required isStop,
  required onTapEnd,
  required onTapReset,
  required flag,
  required stopWatchButton,
  required d,
}) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Design(
          size: size,
          min: min,
          second: second,
          colorFirst: Colors.orange,
          colorSecond: Colors.red,
          boolvalue: "stopWatchButton",
          d: d,
        ),
        //button
        button(
          isStop: isStop,
          timer: timer,
          onTapEnd: onTapEnd,
          onTapReset: onTapReset,
          colorFirst: Colors.orange,
          colorSecond: Colors.red,
          Start: () {
            if (!isStop) {
              timer();
            }
          },
        ),
        //lap
        Column(
          children: List.generate(
            flag.length,
            (index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Lap ${index + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  flag[index],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
