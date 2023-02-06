import 'package:flutter/material.dart';
import 'package:pomotoro/model/timer_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const defaultTimer = 1500;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final timerController = Provider.of<TimerModel>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                timerController.timeString,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w700,
                  fontSize: 75,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: timerController.isTimerStart
                  ? IconButton(
                      icon: const Icon(
                        Icons.stop_circle_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          timerController.onTimerStop();
                        });
                      },
                      iconSize: 100,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : IconButton(
                      icon: const Icon(
                        Icons.play_circle_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          timerController.onTimerStart();
                        });
                      },
                      iconSize: 100,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 10,
                              blurStyle: BlurStyle.outer,
                              color: Color.fromARGB(255, 115, 115, 115),
                              offset: Offset(0, 10),
                              spreadRadius: BorderSide.strokeAlignCenter)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Pomodoro",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${timerController.cycleCount}',
                          style: const TextStyle(
                            fontSize: 75,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
