import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.height,
    this.text,
    this.ontap,
    this.padding,
    this.margin,
  }) : super(key: key);

  final double? height;
  final String? text;
  final dynamic ontap;
  final dynamic padding;
  final dynamic margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: padding,
        margin: margin,
        height: height,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text!,
            style: GoogleFonts.aclonica(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

// custom TextField

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    this.suffix, this.onChanged, this.validator, this.controller,
  }) : super(key: key);

  final String hint;
  final Widget? suffix;
  final dynamic onChanged;
  final dynamic validator;
  final dynamic controller;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 75,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            suffixIcon: suffix,
          ),
        ),
      ),
    );
  }
}

// RichText

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {Key? key,
      required this.leading,
      required this.trailing,
      this.trailingColor,
      this.underline,
      this.ontap})
      : super(key: key);

  final String leading;
  final String trailing;
  final Color? trailingColor;
  final dynamic underline;
  final dynamic ontap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: leading,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = ontap,
            text: trailing,
            style: TextStyle(
              decoration: underline,
              fontWeight: FontWeight.w500,
              color: trailingColor,
            ),
          ),
        ],
      ),
    );
  }
}

//news

class CustomNews extends StatelessWidget {
  const CustomNews({
    Key? key,
    required this.artistName,
    required this.title,
    required this.image, this.onTap,
  }) : super(key: key);

  final String artistName;
  final String title;
  final String image;
  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(image),
                Container(
                  padding: const EdgeInsets.only(top: 150, left: 90),
                  width: 130,
                  child: const CustomPlayBtn(),
                ),

            ],
          ),
          const SizedBox(height: 0),
          Text(
            title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Text(
            artistName,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14),
          )
        ],
      ),
    );
  }
}

//play button

class CustomPlayBtn extends StatelessWidget {
  const CustomPlayBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xffe6e6e6),
      radius: 30,
      child: Image.asset(
        'images/play.png',
        scale: 0.6,
      ),
    );
  }
}
