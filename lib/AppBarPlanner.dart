import 'package:flutter/material.dart';
import 'package:planner/TimersListView.dart';
import 'main.dart';
import 'AlarmsListView.dart';
import 'TasksListView.dart';
import 'SettingsListView.dart';

class AppBarPlanner extends StatelessWidget {
  const AppBarPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 4;
    return DefaultTabController(
        initialIndex: 1, length: tabsCount,
        child: Scaffold (
            appBar: AppBar(
              title: const Text('AppBar Sample'),
              // This check specifies which nested Scrollable's scroll notification
              // should be listened to.
              //
              // When `ThemeData.useMaterial3` is true and scroll view has
              // scrolled underneath the app bar, this updates the app bar
              // background color and elevation.
              //
              // This sets `notification.depth == 1` to listen to the scroll
              // notification from the nested `ListView.builder`.
              notificationPredicate: (ScrollNotification notification) {
                return notification.depth == 1;
              },
              // The elevation value of the app bar when scroll view has
              // scrolled underneath the app bar.
              scrolledUnderElevation: 4.0,
              shadowColor: Theme.of(context).shadowColor,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: const Icon(Icons.timer),
                    text: titles[0],
                  ),
                  Tab(
                    icon: const Icon(Icons.access_alarm),
                    text: titles[1],
                  ),
                  Tab(
                    icon: const Icon(Icons.task_alt_outlined),
                    text: titles[2],
                  ),
                  Tab(
                    icon: const Icon(Icons.settings),
                    text: titles[3],
                  ),
                ],
              ),
            ),
            body: TabBarView(children: <Widget>[
              TimersListViewWithPopupMenuButton(),
              AlarmsListViewWithPopupMenuButton(),
              TasksListViewWithPopupMenuButton(),
              SettingsListViewWithPopupMenuButton()
            ])));
  }
}
