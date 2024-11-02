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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isTablet = ResponsiveBreakpoints.of(context).largerThan(TABLET);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Portfolio', style: GoogleFonts.onest(
          fontSize: 20,
          color: primaryColor,
          fontWeight: FontWeight.w700,
        ),),
        centerTitle: false,
        leading: IconButton(onPressed: (){
          _scaffoldKey.currentState?.openDrawer();
        }, 
            icon: Image.asset(Images.menu,height: 25,width: 25,color: primaryColor,)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomButton(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                text: "Hire Me",
                width : width / 4,
                height: 40, onTap: (){},
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
                padding: EdgeInsets.symmetric(horizontal: mainP,vertical: p),
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
                        if(mounted) {
                          setState(() {
                          showSecondText = true;
                        });
                        }
                      },
                      primaryStyle: GoogleFonts.onest(color: Colors.black),
                      secondaryStyle:  GoogleFonts.onest(color: primaryColor),
                      changeAfterLetter: 25,
                    ),
                    SizedBox(height: mainP,),
                    Text(
                      "Hi! I'm a skilled Flutter developer with over 2 year of "
                          "experience in creating robust mobile apps for Android and iOS.",
                      style: GoogleFonts.onest(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: darkColor
                      ),
                    ),
                    const SizedBox(height: 16,),
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
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),topRight: Radius.circular(24))
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: p,),
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
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),topRight: Radius.circular(24))
                                      ),
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
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),topRight: Radius.circular(24))
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(Images.myPic,height: 290,),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16,),
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
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Portfolio',style: GoogleFonts.onest(
                                      color: backgroundColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14
                                  ),),
                                  Image.asset(Images.arrow,height: 10,width: 10,color: backgroundColor,)
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: (){},
                              child: Center(
                                child: Text('Contact Me',style: GoogleFonts.onest(
                                    fontWeight: FontWeight.w700,
                                    color: darkColor,
                                    fontSize: 14
                                ),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        // border: Border.all(color: greyLightColor.withOpacity(1)),
                        borderRadius: BorderRadius.circular(mainP),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.03), // Shadow color
                              spreadRadius: 2, // Spread radius
                              blurRadius: 6, // Blur radius
                              offset: const Offset(-1, 3),
                              blurStyle: BlurStyle.normal // Position the shadow above the container
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('10+',style: GoogleFonts.onest(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32
                                      ),),
                                      Text('Projects',style: GoogleFonts.onest(
                                          color: greyColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14
                                      ),),

                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('2',style: GoogleFonts.onest(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32
                                      ),),
                                      Text('Companies',style: GoogleFonts.onest(
                                          color: greyColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14
                                      ),),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('1.5+',style: GoogleFonts.onest(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32
                                  ),),
                                  Text('Years Experience',style: GoogleFonts.onest(
                                      color: greyColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14
                                  ),),

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                  ],
                ),
              ),
              Container(
                height: 500,
                width: width,
                color: Color(0xffe8edfe),

              ),
              Container(
                height: 500,
                width: width,
                color: Colors.black.withOpacity(0.9),

              ),
              Container(
                height: 500,
                width: width,
                color: Color(0xffe8edfe),

              ),
              SizedBox(height: p),

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

    _animation = IntTween(begin: 0, end: widget.text.length)
        .animate(_controller)
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



