import 'package:flutter/material.dart';
import 'package:hello_dog/pages/hello_page1.dart';
import 'package:hello_dog/pages/hello_page2.dart';
import 'package:hello_dog/pages/hello_page3.dart';
import 'package:hello_dog/utils/nav.dart';
import 'package:hello_dog/widgets/blue_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
          height: 300,
          child: PageView(
            children: <Widget> [
              _img("assets/images/dog1.png"),
              _img("assets/images/dog2.png"),
              _img("assets/images/dog3.png"),
              _img("assets/images/dog4.png"),
              _img("assets/images/dog5.png"),
            ],
          ),
        );
  }

  _buttons(context) {
    return Column(
          children: <Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                BlueButton("ListView", onPressed: () => _onClickNavigator(context, HelloPage1())),
                BlueButton("Page 2", onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3", onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                BlueButton("Snack", onPressed: _onClickSnack),
                BlueButton("Dialog", onPressed: _onClickDialog),
                BlueButton("Toast", onPressed: _onClickToast),
              ],
            )
          ],
        );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(">> $s");
  }

  _onClickSnack() {
  }

  _onClickDialog() {
  }

  _onClickToast() {
  }

  _img(String img) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      )


    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}
