import 'package:clock_app/heders.dart';
import 'package:flutter/cupertino.dart';

Widget button({
  required isStop,
  required timer,
  required onTapEnd,
  onTapflag,
  required onTapReset,
  required colorFirst,
  required colorSecond,
  required Start,
  flagon,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      //start
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colorFirst,
                      colorSecond,
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: Start,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(15),
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              child: const Text(
                'Start',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Visibility(
        visible: isStop == true,
        child: Column(
          children: [
            //end
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            colorFirst,
                            colorSecond,
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onTapEnd,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    child: const Text(
                      'Stop',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: flagon != true,
              child: const SizedBox(
                height: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: flagon == true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              colorFirst,
                              colorSecond,
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: onTapflag,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        textStyle: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      icon: const Icon(
                        Icons.flag,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Add Flag',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      //restart
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colorFirst,
                      colorSecond,
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: onTapReset,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(15),
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              child: const Text(
                'Reset',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
