import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_pref_dan_hive/home.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({Key? key}) : super(key: key);

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    itemCount: demoData.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) => OnboardContent(
                          image: demoData[index].image,
                          title: demoData[index].title,
                          title2: demoData[index].title2,
                        )),
              ),
              Row(
                children: [
                  ...List.generate(
                      demoData.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          )),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/arrow-right.svg",
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomSheet: _pageIndex == 2
          ? Container(
              height: 90.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x3B1D2429),
                    offset: Offset(0, -3),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: GestureDetector(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHomePage', true);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Mulai',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 104, 97),
                            fontSize: 34.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const Text(''),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive ? Colors.red : Colors.red.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Onboard {
  final String image, title, title2;

  Onboard({
    required this.image,
    required this.title,
    required this.title2,
  });
}

final List<Onboard> demoData = [
  Onboard(
    image: "assets/images/undraw_Newspaper_re_syf5.png",
    title: "Beli apa saja\n Dari ",
    title2: "smartphone mu",
  ),
  Onboard(
    image: "assets/images/undraw_Sharing_articles_re_jnkp.png",
    title: "Dapatkan dengan harga\n Yang ",
    title2: "Murah",
  ),
  Onboard(
    image: "assets/images/undraw_Happy_news_re_tsbd.png",
    title: "Alat Tulis, Perlengkapan Sekolah &\n Kantor, ",
    title2: "& apa saja",
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.title2,
  }) : super(key: key);

  final String image, title, title2;

  final onTextStyle1 = const TextStyle(
    color: Color.fromRGBO(47, 46, 65, 1),
    fontSize: 24.0,
    height: 1.2,
  );

  final onTextStyle2 = const TextStyle(
    color: Color.fromRGBO(255, 105, 97, 1),
    fontSize: 24.0,
    height: 1.2,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 350,
        ),
        const SizedBox(height: 16),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: <TextSpan>[
            TextSpan(text: title, style: onTextStyle1),
            TextSpan(text: title2, style: onTextStyle2),
          ]),
        ),
        const Spacer(),
      ],
    );
  }
}
