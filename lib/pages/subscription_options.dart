import 'package:cook_it/widgets/app_bar.dart';
import 'package:cook_it/widgets/subscription_opens_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SubscriptionOptions extends StatefulWidget {
  const SubscriptionOptions({Key? key}) : super(key: key);

  @override
  State<SubscriptionOptions> createState() => _SubscriptionOptionsState();
}

class _SubscriptionOptionsState extends State<SubscriptionOptions> {
  double _value = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: CustomAppBar(
          heading: "Subscription",
        ),
        body: Center(
          child: Container(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40, left: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.35,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "FROM",
                          style: TextStyle(
                              fontFamily: "StolzlRegular",
                              color: Colors.white,
                              fontSize: 50),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$ ",
                              style: TextStyle(
                                  fontFamily: "StolzlRegular",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 30),
                            ),
                            Text(
                              "1.99 ",
                              style: TextStyle(
                                  fontFamily: "StolzlRegular",
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 30),
                            ),
                            Text(
                              " / mo",
                              style: TextStyle(
                                  fontFamily: "StolzlRegular",
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "•  44 ",
                              style: TextStyle(
                                  fontFamily: "StolzlBook",
                                  color: Colors.white,
                                  fontSize: 17),
                            ),
                            Text(
                              "new recipes",
                              style: TextStyle(
                                  fontFamily: "StolzlBook",
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 20),
                        child: SubscriptionOpensText(
                          whatOpened: "Salads",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 20),
                        child: SubscriptionOpensText(
                          whatOpened: "Deserts",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 20),
                        child: SubscriptionOpensText(
                          whatOpened: "Sauces",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 20, bottom: 50),
                        child: SubscriptionOpensText(
                          whatOpened: "Drinks",
                        ),
                      ),
                      Spacer(),
                      Padding(
                          padding:
                              EdgeInsets.only(bottom: 15, left: 20, right: 20),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: MediaQuery.of(context).size.width / 1.6,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Purchase",
                                  style: TextStyle(
                                      color: Color(0xFFD9D9D9).withOpacity(0.9),
                                      fontFamily: "StolzlRegular",
                                      fontSize: 20),
                                ),
                              ))),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 40, bottom: 40, right: 40, left: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.35,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "FROM",
                          style: TextStyle(
                              fontFamily: "StolzlRegular",
                              color: Colors.white,
                              fontSize: 50),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$ ",
                              style: TextStyle(
                                  fontFamily: "StolzlRegular",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 30),
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                  fontFamily: "StolzlRegular",
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Support ",
                              style: TextStyle(
                                  fontFamily: "StolzlBook",
                                  color: Colors.white,
                                  fontSize: 17),
                            ),
                            Text(
                              "developers",
                              style: TextStyle(
                                  fontFamily: "StolzlBook",
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "as much as you want",
                              style: TextStyle(
                                  fontFamily: "StolzlBook",
                                  color: Colors.white,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "\$",
                                    style: TextStyle(
                                        fontFamily: "StolzlRegular",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepOrangeAccent,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    _value >= 10.0
                                        ? _value.toString().substring(0, 2)
                                        : _value.toString().substring(0, 1),
                                    style: TextStyle(
                                        fontFamily: "StolzlBook",
                                        color: Colors.white,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            Slider(
                              activeColor: Colors.deepOrangeAccent,
                              inactiveColor: Colors.white54,
                              min: 1,
                              max: 99,
                              value: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                          padding:
                              EdgeInsets.only(bottom: 15, left: 20, right: 20),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: MediaQuery.of(context).size.width / 1.6,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Support",
                                  style: TextStyle(
                                      color: Color(0xFFD9D9D9).withOpacity(0.9),
                                      fontFamily: "StolzlRegular",
                                      fontSize: 20),
                                ),
                              ))),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ));
  }
}
