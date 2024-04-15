import 'package:clock_app/heders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget stopWatch({
  required size,
  required timer,
  required min,
  required second,
  required isStop,
  required onTapEnd,
  required onTapFlag,
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
          onTapflag: onTapFlag,
          onTapReset: onTapReset,
          colorFirst: Colors.orange,
          colorSecond: Colors.red,
          Start: () {
            if (!isStop) {
              timer();
            }
          },
          flagon: true,
        ),
        const SizedBox(
          height: 20,
        ),
        //lap
        SizedBox(
          height: 150,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                flag.length,
                (index) => Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Row(
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
              ),
            ),
          ),
        )
      ],
    ),
  );
}
