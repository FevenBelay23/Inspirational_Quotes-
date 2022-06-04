import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).go("/login");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor:
            lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              SizedBox(
                height: !isLandscape
                    ? MediaQuery.of(context).size.height
                    : MediaQuery.of(context).size.height + 250,
                child: Stack(
                  children: [
                    SizedBox(
                      height: !isLandscape
                          ? MediaQuery.of(context).size.height
                          : MediaQuery.of(context).size.height + 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assets/images/images.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Content(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 150,
            backgroundImage: AssetImage("assets/images/images.jpg"),
            child: Text("Welcome"),
          ),
          SizedBox(
            height: 20,
          ),
          SpinKitCircle(
            size: 40,
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
