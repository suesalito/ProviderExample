import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Text(Provider.of<Data>(context, listen: true).data);
    // return Consumer<Data>(
    //   builder: (context, data, child) {
    //     return Text(data.data);
    //   },
    // );
    return Text(Provider.of<Data>(context, listen: false).data);
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //   return Consumer<Data>(
    //     builder: (context, data, child) {
    //       return TextField(
    //         onChanged: (newText) {
    //           print(newText);
    //           // this is called to change the txt of the Data class.
    //           data.changeString(newText);
    //         },
    //       );
    //     },
    //   );
    // }
    return TextField(
      onChanged: (newText) {
        print(newText);
        // this is called to change the txt of the Data class.
        // **Note that you need to specify listen = false so the method will update without rebuild.
        // to make it work. If you does not set the listen = false, the String NexText will not update the data variable.
        Provider.of<Data>(context, listen: false).changeString(newText);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Some data';

  void changeString(String newString) {
    print(2);
    data = newString;
    notifyListeners();
  }
}
