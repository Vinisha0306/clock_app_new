import 'package:clock_app/heders.dart';

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
      const Duration(seconds: 1),
      () {
        setState(
          () {
            if (isStop) {
              second++;
            }

            if (second > 59) {
              second++;
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
            //clock
            Visibility(
              visible: clockButton == true,
              child: Expanded(
                child: Column(
                  children: [
                    Design(
                      size: size,
                      min: min,
                      second: second,
                      colorFirst: Colors.pink,
                      colorSecond: Colors.purple,
                      boolvalue: "clockButton",
                      d: d,
                    ),
                    Text(
                      "${(d.hour % 12).toString().padLeft(2, '0')} : ${d.minute.toString().padLeft(2, '0')} : ${d.second.toString().padLeft(2, '0')}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: <Color>[
                              Colors.pink,
                              Colors.purple,
                            ],
                          ).createShader(
                            const Rect.fromLTWH(200, 50, 100, 150),
                          ),
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    )
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
                isStop: isStop,
                onTapEnd: () {
                  isStop = false;
                  setState(() {});
                },
                onTapFlag: () {
                  String lap =
                      "${min.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}";
                  setState(
                    () {
                      flag.add(lap);
                    },
                  );
                },
                onTapReset: () {
                  isStop = false;
                  min = second = 0;
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
                    const SizedBox(
                      height: 30,
                    ),
                    Design(
                      size: size,
                      min: min,
                      second: second,
                      colorFirst: Colors.greenAccent,
                      colorSecond: Colors.blue,
                      boolvalue: "timerButton",
                      d: d,
                      timerHour: timerHour,
                      timerMinute: timerMinute,
                      timerSecond: timerSecond,
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
                    const SizedBox(
                      height: 20,
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
            PageButton(
              stopWatchButton: stopWatchButton,
              clockButton: clockButton,
              timerButton: timerButton,
              onTapClock: () {
                stopWatchButton = false;
                clockButton = true;
                timerButton = false;
                setState(() {});
              },
              onTapStopwatch: () {
                stopWatchButton = true;
                clockButton = false;
                timerButton = false;
                setState(() {});
              },
              onTapTimer: () {
                stopWatchButton = false;
                clockButton = false;
                timerButton = true;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
