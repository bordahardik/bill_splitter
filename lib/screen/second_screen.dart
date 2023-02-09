import 'package:bill_splitter_app/components/circle_avatar_widget.dart';
import 'package:bill_splitter_app/constants/constants.dart';
import 'package:bill_splitter_app/getx/homepage_crontroller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _homePageController = Get.find<HomePageController>();
  double _isValue = 0;
  double _isValue1 = 0;
  double _isValue2 = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: screenSize.height / 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: screenSize.width / 4.5,
                        width: screenSize.width / 4.5,
                        decoration: BoxDecoration(
                          color: kCherryPie,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: kCherryPie.withOpacity(0.5),
                                offset: const Offset(5, 5),
                                spreadRadius: 2,
                                blurRadius: 10)
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: kMarzipan,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Split Now',
                      style: TextStyle(color: kMarzipan, fontSize: 20),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.more_vert,
                      color: kMarzipan,
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      _receiptView(screenSize),
                      const SizedBox(
                        height: 20,
                      ),
                      _meSlider(screenSize),
                      const SizedBox(
                        height: 15,
                      ),
                      _codySlider(screenSize),
                      const SizedBox(
                        height: 15,
                      ),
                      _khalifaSlider(screenSize),
                      const SizedBox(
                        height: 15,
                      ),
                      _bottomBtnBox(screenSize),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _bottomBtnBox(Size screenSize) {
    return Container(
      height: screenSize.height * 0.1,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kCherryPie, borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _homePageController
                  .updateTotalBill(_isValue + _isValue1 + _isValue2);
            },
            child: Container(
              width: (screenSize.width / 2) - 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: kMulledWine, borderRadius: BorderRadius.circular(50)),
              child: const Text(
                'Confirm Split',
                style: TextStyle(color: kMarzipan, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: (screenSize.width / 2) - 40,
            child: const Text(
              'Cancel',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _khalifaSlider(Size screenSize) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatarWidget(
              backgroundColor: kWaxFlower,
              borderColor: Colors.white,
              image: 'assets/images/avatar_4.png',
              borderWidth: 1,
              size: screenSize.height * 0.05,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Khalifa',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const Spacer(),
            Text(
              '\$$_isValue2',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
              activeTrackColor: kWaxFlower,
              inactiveTrackColor: kCherryPie,
              trackHeight: 20,
              overlayColor: kMarzipan.withOpacity(0.2),
              activeTickMarkColor: kMarzipan,
              inactiveTickMarkColor: kMarzipan,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 15.0,
              ),
              thumbColor: kMarzipan),
          child: Slider(
            value: _isValue2,
            onChanged: (value) {
              setState(() {
                _isValue2 = value;
              });
            },
            divisions: 5,
            max: 500,
          ),
        ),
      ],
    );
  }

  Widget _codySlider(Size screenSize) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatarWidget(
              backgroundColor: const Color(0xFFB59AEF),
              borderColor: Colors.white,
              image: 'assets/images/avatar_3.png',
              borderWidth: 1,
              size: screenSize.height * 0.05,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Cody',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const Spacer(),
            Text(
              '\$$_isValue1',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
              activeTrackColor: const Color(0xFFB59AEF),
              inactiveTrackColor: kCherryPie,
              trackHeight: 20,
              overlayColor: kMarzipan.withOpacity(0.2),
              activeTickMarkColor: kMarzipan,
              inactiveTickMarkColor: kMarzipan,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 15.0,
              ),
              thumbColor: kMarzipan),
          child: Slider(
            value: _isValue1,
            onChanged: (value) {
              setState(() {
                _isValue1 = value;
              });
            },
            divisions: 5,
            max: 500,
          ),
        ),
      ],
    );
  }

  Widget _meSlider(Size screenSize) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatarWidget(
              backgroundColor: const Color(0xFF90B5DF),
              borderColor: Colors.white,
              image: 'assets/images/avatar_2.png',
              borderWidth: 1,
              size: screenSize.height * 0.05,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Me',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const Spacer(),
            Text(
              '\$$_isValue',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
              activeTrackColor: const Color(0xFF90B5DF),
              inactiveTrackColor: kCherryPie,
              trackHeight: 20,
              overlayColor: kMarzipan.withOpacity(0.2),
              activeTickMarkColor: kMarzipan,
              inactiveTickMarkColor: kMarzipan,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 15.0,
              ),
              thumbColor: kMarzipan),
          child: Slider(
            value: _isValue,
            onChanged: (value) {
              setState(() {
                _isValue = value;
              });
            },
            divisions: 5,
            max: 500,
          ),
        ),
      ],
    );
  }

  Stack _receiptView(Size screenSize) {
    return Stack(
      children: [
        Container(
          height: screenSize.height / 3.2,
          // width: screenSize.width,
          decoration: BoxDecoration(
              color: kMarzipan, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: screenSize.width / 8,
                width: screenSize.width / 3.25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: kCherryPie, borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'Receipt',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: screenSize.height / 3.2 * 0.13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Title',
                        style: TextStyle(color: kMulledWine),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Team Dinner',
                        style: TextStyle(
                            color: kMulledWine,
                            fontSize: screenSize.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Bill',
                        style: TextStyle(color: kMulledWine),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$${_isValue + _isValue1 + _isValue2}',
                        style: TextStyle(
                            color: kMulledWine,
                            fontSize: screenSize.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: (screenSize.height / 3.2) -
                      (37 +
                          (screenSize.width / 8) +
                          (screenSize.height / 3.2 * 0.13) +
                          (screenSize.width * 0.05) +
                          (screenSize.width * 0.05)),
                  width: screenSize.width,
                  decoration: BoxDecoration(
                      color: kMulledWine,
                      borderRadius: BorderRadius.circular(
                          ((screenSize.height / 3.2) -
                                  (37 +
                                      (screenSize.width / 8) +
                                      (screenSize.height / 3.2 * 0.13) +
                                      (screenSize.width * 0.05) +
                                      (screenSize.width * 0.05))) /
                              3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            left: 20,
                            child: CircleAvatarWidget(
                              backgroundColor: kWaxFlower,
                              image: 'assets/images/avatar_4.png',
                              borderColor: Colors.transparent,
                              borderWidth: 0,
                              size: ((screenSize.height / 3.2) -
                                      (37 +
                                          (screenSize.width / 8) +
                                          (screenSize.height / 3.2 * 0.13) +
                                          (screenSize.width * 0.05) +
                                          (screenSize.width * 0.05))) /
                                  2,
                            ),
                          ),
                          Positioned(
                            right: 20,
                            child: CircleAvatarWidget(
                              backgroundColor: const Color(0xFFB59AEF),
                              image: 'assets/images/avatar_3.png',
                              borderColor: Colors.transparent,
                              borderWidth: 0,
                              size: ((screenSize.height / 3.2) -
                                      (37 +
                                          (screenSize.width / 8) +
                                          (screenSize.height / 3.2 * 0.13) +
                                          (screenSize.width * 0.05) +
                                          (screenSize.width * 0.05))) /
                                  2,
                            ),
                          ),
                          CircleAvatarWidget(
                            backgroundColor: const Color(0xFF90B5DF),
                            image: 'assets/images/avatar_2.png',
                            borderColor: kMulledWine,
                            borderWidth: 1,
                            size: ((screenSize.height / 3.2) -
                                    (37 +
                                        (screenSize.width / 8) +
                                        (screenSize.height / 3.2 * 0.13) +
                                        (screenSize.width * 0.05) +
                                        (screenSize.width * 0.05))) /
                                2,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Splitting With',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: ((screenSize.height / 3.2) -
                                    (37 +
                                        (screenSize.width / 8) +
                                        (screenSize.height / 3.2 * 0.13) +
                                        (screenSize.width * 0.05) +
                                        (screenSize.width * 0.05))) /
                                4.6),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const Positioned(
          top: 50,
          left: -25,
          child: CircleAvatar(
            backgroundColor: kMulledWine,
          ),
        ),
        const Positioned(
          top: 50,
          right: -25,
          child: CircleAvatar(
            backgroundColor: kMulledWine,
          ),
        ),
        Positioned(
          top: 70,
          child: SvgPicture.string(
            '<svg viewBox="46.5 341.5 328.0 1.0" ><path transform="translate(46.5, 341.5)" d="M 0 0 L 328 0" fill="none" stroke="#48426d" stroke-width="2" stroke-dasharray="5 5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
            width: screenSize.width,
          ),
        ),
      ],
    );
  }
}
