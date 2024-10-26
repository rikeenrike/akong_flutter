// ui/home_screen.dart
import 'package:akong_flutter/models/weather_model.dart';
import 'package:akong_flutter/services/weather_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../provider/task_provider.dart';
import '../provider/profile_provider.dart';
import 'add_task_screen.dart';
import 'profile.dart';
import 'task_detail_screen.dart';
import '../main.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _weatherService = WeatherService("468421af4bd2943e41d9a201a1943f3c");
  WeatherModel? _weather;
  final isDarkMode = DateTime.now().hour >= 18;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);

      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  String getWeatherAnimation(String? mainCondition) {
    if (isDarkMode) {
      switch (mainCondition) {
        case "Clear":
          return 'assets/night.json';
        case "Clouds":
          return 'assets/cloudy-night.json';
        case "Rain":
          return 'assets/rainy-night.json';
        case "Snow":
          return 'assets/snowy-night.json';
        default:
          return 'assets/night.json';
      }
    } else {
      switch (mainCondition) {
        case "Clear":
          return 'assets/sunny.json';
        case "Clouds":
          return 'assets/cloudy.json';
        case "Rain":
          return 'assets/rainy.json';
        case "Snow":
          return 'assets/snowy.json';
        default:
          return 'assets/sunny.json';
      }
    }
  }

  String getTimeOfDay() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Morning";
    } else if (hour < 17) {
      return "Afternoon";
    } else {
      return "Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskProviderInstance = ref.watch(taskProvider);
    final profile = ref.watch(profileProvider);

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:20),
                    Text(
                      "Good ${getTimeOfDay()},",
                      style:
                          TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      profile.name,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: _weather == null
                          ? CupertinoActivityIndicator()
                          : Container(
                              width: 400, // Adjust the width as needed
                              padding:
                                  EdgeInsets.all(16), // Add padding if needed
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 0, 123, 255), // Replace with your desired color
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the radius as needed
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 180,
                                    child: Lottie.asset(
                                      getWeatherAnimation(
                                          _weather!.mainCondition),
           
                                    ),
                                  ),
                                // Add spacing between the Lottie animation and the text
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _weather!.cityName,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: CupertinoColors
                                              .white, // Ensure text is visible on the background
                                        ),
                                      ),
                                      Text(
                                        "${_weather!.temperature}°C",
                                        style: TextStyle(
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold,
                                          color: CupertinoColors
                                              .white, // Ensure text is visible on the background
                                        ),
                                      ),
                                      Text(
                                        _weather!.mainCondition,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: CupertinoColors
                                              .white, // Ensure text is visible on the background
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ],
                )),
            
            //TASKS
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Tasks",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: taskProviderInstance.tasks.isEmpty
                  ? Center(
                      child: Text(
                        "No Task Available",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      itemCount: taskProviderInstance.tasks.length,
                      itemBuilder: (context, index) {
                        final task = taskProviderInstance.tasks[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 19.0),
                          child: CupertinoButton(
                            padding: EdgeInsets.all(12),
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      TaskDetailScreen(taskIndex: index),
                                ),
                              );
                            },
                            child: Container(
                              // Add Container to force full width
                              width: double
                                  .infinity, // This makes it take full available width
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    task.done
                                        ? CupertinoIcons.check_mark
                                        : CupertinoIcons.circle,
                                    color: task.done
                                        ? CupertinoColors.activeGreen
                                        : CupertinoColors.white,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    // Changed from Flexible to Expanded
                                    child: Text(
                                      task.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      showCupertinoDialog(
                                        context: context,
                                        builder: (context) {
                                          return CupertinoAlertDialog(
                                            title: Text("Delete Task"),
                                            content: Text(
                                                "Are you sure you want to delete this task?"),
                                            actions: [
                                              CupertinoDialogAction(
                                                child: Text("Yes"),
                                                onPressed: () {
                                                  ref
                                                      .read(taskProvider)
                                                      .deleteTask(index);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              CupertinoDialogAction(
                                                child: Text("No"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Icon(CupertinoIcons.delete,
                                        color: CupertinoColors.systemRed),
                                  ),
                                ],
                              ),
                            ),
                            color: CupertinoColors.systemBlue,
                          ),
                        );
                      },
                    ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    },
                    child: Icon(CupertinoIcons.person, size: 30),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => AddTaskScreen()),
                      );
                    },
                    child: Icon(CupertinoIcons.add, size: 30),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (taskProviderInstance.tasks.isEmpty) {
                        return;
                      }
                      showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text("Delete All Task"),
                              content: Text(
                                  "Are you sure you want to delete all task?"),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("Yes"),
                                  onPressed: () {
                                    ref.read(taskProvider).deleteallTask();
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text("No"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Icon(CupertinoIcons.delete, size: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
