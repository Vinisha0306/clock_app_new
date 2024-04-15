import 'package:clock_app/heders.dart';

Widget PageButton({
  required stopWatchButton,
  required clockButton,
  required timerButton,
  required onTapClock,
  required onTapStopwatch,
  required onTapTimer,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      //clock
      ElevatedButton(
        onPressed: onTapClock,
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
        onPressed: onTapStopwatch,
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
        onPressed: onTapTimer,
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
  );
}
