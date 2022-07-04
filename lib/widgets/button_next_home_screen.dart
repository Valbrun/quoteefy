import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quoteefy/providers/quote_provider.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({
    Key? key,
    required this.fullWidth,
  }) : super(key: key);

  final double fullWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.red,
      onTap: () =>
          Provider.of<QuoteProvider>(context, listen: false).setIndex(),
      child: Container(
        width: fullWidth * 0.9,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // shape: BoxShape.circle,
          color: Colors.grey[300],
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Give me more',
            style: GoogleFonts.spirax(
              fontSize: 37,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 156, 92, 87),
            ),
          ),
        ),
      ),
    );
  }
}
