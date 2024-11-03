import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/sidemenu.dart';
import 'package:portfolio/theme.dart';
import 'package:portfolio/utilities/custom_button.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'images.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showSecondText = false;

  Widget platformButton(String image, Color color, String text, double width,
      Color textColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mainP),
          color: color,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: mainP),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: GoogleFonts.onest(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceContainer(String image, String title, String text,VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 190,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(p),
            border: Border.all(color: primaryColor)
        ),
        child: Padding(
          padding: EdgeInsets.all(mainP),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mainP)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(p),
                    child: Image.asset(image,fit: BoxFit.cover,)),
              ),
              SizedBox(width: p,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: GoogleFonts.onest(
                        fontSize: 18,fontWeight: FontWeight.w700,color: backgroundColor
                    ),),
                    SizedBox(height: p,),
                    Text(
                      text,style: GoogleFonts.onest(
                        fontSize: 14,fontWeight: FontWeight.w600,color: greyColor
                    ),),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  Widget workspaceContainer(String image, String title, String text,VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 280,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          // border: Border.all(color: greyLightColor.withOpacity(1)),
          borderRadius: BorderRadius.circular(mainP),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.03),
                // Shadow color
                spreadRadius: 2,
                // Spread radius
                blurRadius: 6,
                // Blur radius
                offset: const Offset(-1, 3),
                blurStyle: BlurStyle
                    .normal // Position the shadow above the container
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                  width: 130,
                  child: Image.asset(image,fit: BoxFit.contain,),
                ),
                const SizedBox(height: 30,),
                Text(
                  title,
                  style: GoogleFonts.onest(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: darkColor),
                ),
                const Spacer(),
                Text(
                  text,
                  style: GoogleFonts.onest(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: darkColor),
                ),

              ],
            ),
          ),
        ),
      )
    );
  }

  Widget projectContainer(String image, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 290,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16)
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(image,fit: BoxFit.cover,)),
            ),
            Spacer(),
            Center(
              child: Text(
                title,
                style: GoogleFonts.onest(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: darkColor),
              ),
            ),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isTablet = ResponsiveBreakpoints.of(context).largerThan(TABLET);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Portfolio',
          style: GoogleFonts.onest(
            fontSize: 20,
            color: primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Image.asset(
              Images.menu,
              height: 25,
              width: 25,
              color: primaryColor,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomButton(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              text: "Hire Me",
              width: width / 4,
              height: 40,
              onTap: () {},
              backgroundColor: primaryColor,
            ),
          )
        ],
      ),
      drawer: const SideMenu(),
      body: SizedBox(
        width: width,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mainP, vertical: p),
                child: Column(
                  children: [
                    TypeWriterText(
                      text: "I'm Usama Ilyas Creative Flutter App Developer",
                      style: GoogleFonts.onest(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      duration: const Duration(milliseconds: 2000),
                      onFinished: () {
                        if (mounted) {
                          setState(() {
                            showSecondText = true;
                          });
                        }
                      },
                      primaryStyle: GoogleFonts.onest(color: Colors.black),
                      secondaryStyle: GoogleFonts.onest(color: primaryColor),
                      changeAfterLetter: 25,
                    ),
                    SizedBox(
                      height: mainP,
                    ),
                    Text(
                      "Hi! I'm a skilled Flutter developer with over 2 year of "
                      "experience in creating robust mobile apps for Android and iOS.",
                      style: GoogleFonts.onest(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: darkColor),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 308,
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 150,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xffeee5fe),
                                              Color(0xffe8ecfe),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(24),
                                              topRight: Radius.circular(24))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: p,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      height: 150,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xfff3dfff),
                                              Color(0xffe9ebfe),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(24),
                                              topRight: Radius.circular(24))),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 150,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xffeee5fe),
                                        Color(0xffe8ecfe),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(24),
                                        topRight: Radius.circular(24))),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Images.myPic,
                                    height: 290,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xffeee5fe),
                      ),
                      width: width / 1.5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: width / 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: primaryColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Portfolio',
                                    style: GoogleFonts.onest(
                                        color: backgroundColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                  Image.asset(
                                    Images.arrow,
                                    height: 10,
                                    width: 10,
                                    color: backgroundColor,
                                  )
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: TextButton(
                                onPressed: () {},
                                child: Center(
                                  child: Text(
                                    'Contact Me',
                                    style: GoogleFonts.onest(
                                        fontWeight: FontWeight.w700,
                                        color: darkColor,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        // border: Border.all(color: greyLightColor.withOpacity(1)),
                        borderRadius: BorderRadius.circular(mainP),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              // Shadow color
                              spreadRadius: 2,
                              // Spread radius
                              blurRadius: 6,
                              // Blur radius
                              offset: const Offset(-1, 3),
                              blurStyle: BlurStyle
                                  .normal // Position the shadow above the container
                              ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 60,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '10+',
                                        style: GoogleFonts.onest(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 32),
                                      ),
                                      Text(
                                        'Projects',
                                        style: GoogleFonts.onest(
                                            color: greyColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '2',
                                        style: GoogleFonts.onest(
                                            color: primaryColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 32),
                                      ),
                                      Text(
                                        'Companies',
                                        style: GoogleFonts.onest(
                                            color: greyColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 60,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1.5+',
                                    style: GoogleFonts.onest(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32),
                                  ),
                                  Text(
                                    'Years Experience',
                                    style: GoogleFonts.onest(
                                        color: greyColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color(0xffe8edfe),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mainP,vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: width / 1.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: const LinearGradient(
                            colors: [Color(0xffd1c2fd), Color(0xffc1d5fb)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              Images.myPic,
                              fit: BoxFit.contain,
                            )),
                      ),
                      SizedBox(
                        height: mainP,
                      ),
                      Row(
                        children: [
                          Text(
                            "About Me",
                            style: GoogleFonts.onest(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mainP,
                      ),
                      Row(
                        children: [
                          Text(
                            "Why Did You Choose Me?",
                            style: GoogleFonts.onest(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: darkColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "I am a skilled Flutter developer with 2 years of experience, specializing in creating user-friendly and highperformance mobile applications. Proficient in Dart and passionate about delivering innovative solutions, I thrive in"
                              "dynamic environments. Eager to contribute my expertise to impactful projects and collaborate with a forward-thinking"
                              "team to build cutting-edge apps that enhance user experience.",
                              style: GoogleFonts.onest(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: grey),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          text: "Download CV",
                          width: width,
                          textColor: backgroundColor,
                          height: 50,
                          backgroundColor: primaryColor,
                          onTap: () {}),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: p,
                          runSpacing: p,
                          children: [
                            platformButton(Images.linkedin, const Color(0xff1976d2),
                                "Linkedin", width / 3, backgroundColor,(){}),
                            platformButton(Images.github, lightGrey, "Github",
                                width / 3.5, darkColor,(){}),
                            platformButton(Images.wp, const Color(0xff388e3c),
                                "WhatsApp", width / 2.8, backgroundColor,(){}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width,
                color: Colors.black.withOpacity(0.9),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mainP, vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        "Skills",
                        style: GoogleFonts.onest(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: greyColor),
                      ),
                      SizedBox(height: mainP),
                      Text(
                        "My Quality Skills",
                        style: GoogleFonts.onest(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: backgroundColor),
                      ),
                      const SizedBox(height: 35),
                      serviceContainer(
                          Images.mobile,
                          "Mobile App development",
                          "I specialize in building cross-platform mobile applications "
                              "using Flutter,delivering smooth and efficient apps"
                              " for both IOS and android with single codebase.",
                          (){}),
                      SizedBox(height: mainP),
                      serviceContainer(
                          Images.project,
                          "Custom User Interface Design",
                          "I design intuitive, user friendly interfaces tailored to meet user's specific needs,"
                              "ensuring an engaging experience with maintaining"
                              "brand consistency",
                              (){}),
                      SizedBox(height: mainP),
                      serviceContainer(
                          Images.apis,
                          "API Integration (REST APIs)",
                          "I integrate robust apis into mobile app, including Google Maps,"
                              "Pusher and other third-party services to extend functionality and provide seamless data communication",
                              (){}),
                      SizedBox(height: mainP),
                      serviceContainer(
                          Images.firebase,
                          "Firebase & Real-Time Database Integration",
                          "From user authentication to real-time data syncing, I offer complete Firebase Integration to smooth,"
                              "responsive and scalable app functionality",
                              (){}),
                      SizedBox(height: mainP),
                      serviceContainer(
                        Images.node,
                        "Node.js Backend Development",
                        "Specializing in efficient API development and server-side logic, "
                            "I build robust, scalable backends with Node.js, ensuring seamless data flow and secure communication.",
                            () {},
                      ),
                      SizedBox(height: mainP),
                      serviceContainer(
                        Images.sql,
                        "MySQL Database Management",
                        "Experienced in designing and managing relational databases with MySQL,"
                            " I provide reliable data storage solutions and efficient data handling for large-scale applications.",
                            () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width,
                color: const Color(0xffe8edfe),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mainP, vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        "My Work Process",
                        style: GoogleFonts.onest(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: darkColor),
                      ),
                      const SizedBox(height: 25,),
                      workspaceContainer(Images.research, "Research and Design",
                          "I conduct thorough research and design intuitive user experiences, focusing an accessibility and responsiveness",
                              (){}),
                      SizedBox(height: mainP,),
                      workspaceContainer(Images.development, "Development",
                          "I develop high-quality,responsive and interface mobile and web applications"
                              "using Flutter, ensuring optimal performance",
                              (){}),
                      SizedBox(height: mainP,),
                      workspaceContainer(Images.testing, "Testing",
                          "I perform comprehensive testing to ensure functionality, usability and performance,"
                              " guaranteeing a smooth user interface",
                              (){}),
                      SizedBox(height: 30,),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mainP),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        "Portfolio",
                        style: GoogleFonts.onest(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: darkColor),
                      ),
                    ),
                    SizedBox(height: 30),
                    projectContainer(Images.mataverse, "Mataverse App", (){}),
                    SizedBox(height: mainP),
                    Text(
                     'Project description. LIGO takes ride-hailing to the next level with advanced features designed for convenience and security.',
                     style: GoogleFonts.onest(
                     color: greyColor,
                     fontWeight: FontWeight.w400,
                     fontSize: 16
                   ),),
                    SizedBox(height: 60),
                    projectContainer(Images.sun, "Sun App", (){}),
                    SizedBox(height: mainP),
                    Text(
                      'Easily search, compare prices, and book your perfect room with just a few taps. Enjoy exclusive deals, real-time availability,'
                          ' and making every trip memorable',
                      style: GoogleFonts.onest(
                          color: greyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                      ),),
                    SizedBox(height: 60),
                    projectContainer(Images.chat, "Chatting App", (){}),
                    SizedBox(height: mainP),
                    Text(
                      'Google Marketplace app. Seamlessly integrated with Google Maps, our app helps users discover nearby stores, restaurants, and services.',
                      style: GoogleFonts.onest(
                          color: greyColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                      ),),
                    SizedBox(height: 60),
                  ],
                ),
              ),
              Container(
                width: width,
                color: Colors.black.withOpacity(0.9),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      "My Skills",
                      style: GoogleFonts.onest(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: backgroundColor),
                    ),
                    SizedBox(height: 30),
                    // Wrap(
                    //   children: [
                    //     Container(
                    //       height: 200,
                    //       width: 150,
                    //       child: Container(
                    //
                    //       ),
                    //     )
                    //   ],
                    // )
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

class TypeWriterText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration duration;
  final VoidCallback onFinished;
  final TextStyle primaryStyle;
  final TextStyle secondaryStyle;
  final int changeAfterLetter;

  TypeWriterText({
    required this.text,
    required this.style,
    required this.duration,
    required this.onFinished,
    required this.primaryStyle,
    required this.secondaryStyle,
    this.changeAfterLetter = 10, // Default to change after the 10th letter
  });

  @override
  _TypeWriterTextState createState() => _TypeWriterTextState();
}

class _TypeWriterTextState extends State<TypeWriterText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation =
        IntTween(begin: 0, end: widget.text.length).animate(_controller)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              widget.onFinished();
            }
          });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String displayedText = widget.text.substring(0, _animation.value);
    List<TextSpan> spans = [];

    for (int i = 0; i < displayedText.length; i++) {
      spans.add(
        TextSpan(
          text: displayedText[i],
          style: i < widget.changeAfterLetter
              ? widget.primaryStyle
              : widget.secondaryStyle,
        ),
      );
    }

    return RichText(
      text: TextSpan(
        children: spans,
        style: widget.style,
      ),
    );
  }
}
