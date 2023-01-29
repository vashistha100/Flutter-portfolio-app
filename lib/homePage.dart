import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color topColor = Colors.red;
  Color bottomColor = Colors.deepPurple;
  var colorList = [
    Colors.pink,
    Colors.blue,
    Colors.amber,
    Colors.deepPurple,
    Colors.deepOrangeAccent,
  ];
  var index = 0;
  late Uri link;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        bottomColor = Colors.pink;
      });
    });

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Just for practice'),
      // ),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            onEnd: () {
              setState(() {
                index++;
                bottomColor = colorList[index % colorList.length];
                topColor = colorList[(index + 1) % colorList.length];
              });
            },
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  topColor,
                  bottomColor,
                ],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey,
                    child: Image.asset(
                      'assets/programmer.png',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Manish Sharma',
                  style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Programmer | Developer',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20,), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        link = Uri.parse("https://github.com/vashistha100");
                        if (await canLaunchUrl(link)) {
                          launchUrl(link);
                        } else {
                          throw 'Could not launch $link';
                        }
                      },
                      icon: Image.asset(
                        'assets/github.png',
                        width: 200,
                      ),
                    ),
                    IconButton(
                      
                      onPressed: () async {
                        link = Uri.parse(
                            "https://www.linkedin.com/in/manish-sharma-616320224/");
                        if (await canLaunchUrl(link)) {
                          launchUrl(link);
                        } else {
                          throw 'Could not launch $link';
                        }
                      },
                      icon: Image.asset('assets/linkedin.png'),
                    ),
                    IconButton(
                      onPressed: () async {
                        link = Uri.parse("tel:7042926383");
                        if (await canLaunchUrl(link)) {
                          launchUrl(link);
                        }
                      },
                      icon: Image.asset('assets/telephone.png'),
                    ),
                    IconButton(
                      onPressed: () async {
                        link = Uri.parse("mailto: manishsharma5016@gmail.com");
                        if (await canLaunchUrl(link)) {
                          launchUrl(link);
                        }
                      },
                      icon: Image.asset('assets/gmail.png'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
