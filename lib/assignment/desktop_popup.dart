import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
      appBar: AppBar(
        title: const Text('Desktop PopUp'),
      ),
      body: Center(child: DesktopPopUp()),
    ),
  ));
}

class DesktopPopUp extends StatefulWidget {
  const DesktopPopUp({super.key});

  @override
  State<DesktopPopUp> createState() => _DesktopPopUpState();
}

class _DesktopPopUpState extends State<DesktopPopUp> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //set border radius more than 50% of height and width to make circle
        ),
        elevation: 10,
        color: Colors.grey,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/desktop_popup_icon.png',
                width: 64,
                height: 64,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                textAlign: TextAlign.center,
                '正在视频通话中',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'PingFangHK',
                    color: Color.fromRGBO(0, 0, 0, 0.85)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                textAlign: TextAlign.center,
                '您确定离开“我们的设计群”视频通话, 在“IM支援群”新开视频通话?',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'PingFangHK',
                    color: Color.fromRGBO(0, 0, 0, 0.85)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(18, 18, 18, 0.08),
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: const Text(
                            '取消',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: 'PingFangHK',
                                color: Color.fromRGBO(18, 18, 18, 1)),
                          ))),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: const Text(
                        '确定',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'PingFangHK',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    fillColor: MaterialStateProperty.resolveWith((states) {
                      if (!states.contains(MaterialState.selected)) {
                        return Colors.white;
                      }
                      return null;
                    }),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.5),
                    ),
                    side: const BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.15), width: 0.5),
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                    value: _isChecked,
                  ),
                  const Text(
                    '不用再提示',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'PingFangHK',
                        color: Color.fromRGBO(0, 0, 0, 0.85)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
