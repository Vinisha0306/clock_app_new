import 'package:clock_app/heders.dart';
import 'package:clock_app/page/home_page/componets/button.dart';
import 'package:clock_app/page/home_page/componets/design.dart';
import 'package:clock_app/page/home_page/componets/stopWatch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime d = DateTime.now();

  int timerHour = 0;
  int timerMinute = 0;
  int timerSecond = 0;

  int second = 00;
  int m = 0;
  int milis = 00;
  int min = 00;
  List flag = [];

  bool isStop = false;
  bool isStart = false;

  bool stopWatchButton = false;
  bool clockButton = true;
  bool timerButton = false;

  void clock() {
    Future.delayed(const Duration(seconds: 1), () {
      d = DateTime.now();
      setState(() {});
      clock();
    });
  }

  void timer() {
    isStop = true;
    Future.delayed(
      const Duration(milliseconds: 1),
      () {
        setState(
          () {
            if (isStop) {
              milis++;
            }

            if (milis > 59) {
              second++;
              milis = 0;
            }
            if (second > 59) {
              min++;
              second = 0;
            }
            if (min > 59) {
              min = 0;
            }
          },
        );
        if (isStop) {
          timer();
        }
      },
    );
  }

  void Starter() {
    isStart = true;
    Future.delayed(const Duration(seconds: 1), () {
      setState(
        () {
          timerSecond--;

          if (timerSecond < 0) {
            timerMinute--;
            timerSecond = 59;
          }
          if (timerMinute < 0) {
            timerHour--;
            timerMinute = 59;
          }
          if (timerHour == 0 && timerMinute == 0 && timerSecond == 0) {
            isStart = false;
          }
        },
      );
      if (isStart) {
        Starter();
      }
    });
  }

  @override
  void initState() {
    clock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //clock
                ElevatedButton(
                  onPressed: () {
                    stopWatchButton = false;
                    clockButton = true;
                    timerButton = false;
                    setState(() {});
                  },
                  style: clockButton == true
                      ? ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.purple.shade200,
                          ),
                        )
                      : const ButtonStyle(),
                  child: const Text(
                    'Clock',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                //stopwatch
                ElevatedButton(
                  onPressed: () {
                    stopWatchButton = true;
                    clockButton = false;
                    timerButton = false;
                    setState(() {});
                  },
                  style: stopWatchButton == true
                      ? ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.red.shade200,
                          ),
                        )
                      : const ButtonStyle(),
                  child: Text(
                    'StopWatch',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      shadows: [
                        stopWatchButton == true
                            ? const Shadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              )
                            : const Shadow(),
                      ],
                    ),
                  ),
                ),
                //timer
                ElevatedButton(
                  onPressed: () {
                    stopWatchButton = false;
                    clockButton = false;
                    timerButton = true;
                    setState(() {});
                  },
                  style: timerButton == true
                      ? ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blue.shade200,
                          ),
                        )
                      : const ButtonStyle(),
                  child: Text(
                    'Timer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      shadows: [
                        timerButton == true
                            ? const Shadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              )
                            : const Shadow(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //clock
            Visibility(
              visible: clockButton == true,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 180,
                    ),
                    Text(
                      "${(d.hour % 12).toString().padLeft(2, '0')} : ${d.minute.toString().padLeft(2, '0')} : ${d.second.toString().padLeft(2, '0')}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: <Color>[
                              Colors.blueAccent,
                              Colors.deepPurpleAccent,
                            ],
                          ).createShader(
                            const Rect.fromLTWH(200, 50, 100, 150),
                          ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Design(
                      size: size,
                      min: min,
                      second: second,
                      milis: milis,
                      colorFirst: Colors.pink,
                      colorSecond: Colors.purple,
                      boolvalue: "clockButton",
                      d: d,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            //StopWatch
            Visibility(
              visible: stopWatchButton == true,
              child: stopWatch(
                size: size,
                timer: timer,
                min: min,
                second: second,
                milis: milis,
                isStop: isStop,
                onTapEnd: () {
                  isStop = false;
                  setState(() {});
                },
                onTapFlag: () {
                  String lap =
                      "${min.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}.${milis.toString().padLeft(2, '0')}";
                  setState(
                    () {
                      flag.add(lap);
                    },
                  );
                },
                onTapReset: () {
                  isStop = false;
                  min = second = milis = 0;
                  flag.clear();
                  setState(() {});
                },
                flag: flag,
                stopWatchButton: stopWatchButton,
                d: d,
              ),
            ),
            //timer
            Visibility(
              visible: timerButton == true,
              child: Expanded(
                child: Column(
                  children: [
                    Design(
                      size: size,
                      min: min,
                      second: second,
                      milis: milis,
                      colorFirst: Colors.greenAccent,
                      colorSecond: Colors.blue,
                      boolvalue: "timerButton",
                      d: d,
                      timerHour: timerHour,
                      timerMinute: timerMinute,
                      timerSecond: timerSecond,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    button(
                      isStop: isStart,
                      timer: Starter,
                      onTapEnd: () {
                        isStart = false;
                        setState(() {});
                      },
                      onTapReset: () {
                        timerHour = timerMinute = timerSecond = 0;
                      },
                      colorFirst: Colors.greenAccent,
                      colorSecond: Colors.blue,
                      Start: () {
                        if (timerSecond != 0 ||
                            timerMinute != 0 ||
                            timerHour != 0) {
                          Starter();
                        }
                      },
                    ),
                    Visibility(
                      visible: isStart != true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //hour
                          Column(
                            children: [
                              const Text('Hours'),
                              NumberPicker(
                                minValue: 0,
                                maxValue: 59,
                                value: timerHour,
                                onChanged: (val) {
                                  setState(
                                    () {
                                      timerHour = val;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          //minute
                          Column(
                            children: [
                              const Text('Minutes'),
                              NumberPicker(
                                minValue: 0,
                                maxValue: 59,
                                value: timerMinute,
                                onChanged: (val) {
                                  setState(
                                    () {
                                      timerMinute = val;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          //second
                          Column(
                            children: [
                              const Text('Seconds'),
                              NumberPicker(
                                minValue: 0,
                                maxValue: 59,
                                value: timerSecond,
                                onChanged: (val) {
                                  setState(
                                    () {
                                      timerSecond = val;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
