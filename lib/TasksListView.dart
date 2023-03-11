import 'package:flutter/material.dart';
import 'main.dart';

class TasksListViewWithPopupMenuButton extends StatefulWidget {
  @override
  _TasksListView createState() => new _TasksListView();
}

class _TasksListView extends State<TasksListViewWithPopupMenuButton> {
  int selectedLuckyNumber = 0;
  List<int> luckyNumbersList = [7, 69, 420, 100];
  final GlobalKey _menuKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ListView(children: const <Widget>[
      Card(child: ListTile(title: Text('One-line ListTile'))),
      Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text('Task 1'),
          ))
    ]);
  }

  /// Builds a ListTile containing a PopupMenuButton.
  Widget _buildListTile(){

    /// The list containing the [PopUpMenuItem]s
    List<PopupMenuItem> luckyNumbers = [];

    // Add each luckyNumber name into the list of PopupMenuItems, [luckyNumbers]
    for (int luckyNumber in luckyNumbersList) {
      luckyNumbers.add(
          new PopupMenuItem(
            child: new Text("$luckyNumber"),
            value: luckyNumber,
          )
      );
    }

    /// When a [PopUpMenuItem] is selected, we assign its value to
    /// selectedLuckyNumber and rebuild the widget.
    void handlePopUpChanged(int value) {
      setState(() {
        selectedLuckyNumber =  value;
      });
      /// Log the selected lucky number to the console.
      print("The lucky number you selected was $selectedLuckyNumber");
    }

    return new ListTile(
      /// The leading widget is a text widget displaying the [selectedLuckyNumber];
      /// this is to show off the statefulness of this class ;p
      leading: new Text(selectedLuckyNumber.toString()),
      /// The title of the list tile.
      title: new Text("Your lucky number"),
      trailing: new PopupMenuButton(
        key: _menuKey,
        onSelected: (selectedDropDownItem) => handlePopUpChanged(selectedDropDownItem),
        itemBuilder: (BuildContext context) => luckyNumbers,
        tooltip: "Tap me to select a number.",
      ),
      /// When ListTile is tapped, open the popUpMenuButton! Notice how we use
      /// menuKey to do that.
      onTap: () {
        dynamic popUpMenustate = _menuKey.currentState;
        popUpMenustate.showButtonMenu();
      },
    );
  }
}
