import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteefy/providers/quote_provider.dart';
import 'package:quoteefy/widgets/button_next_home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<QuoteProvider>(context).fetchAlbum().then((_) {
        setState(() {
          _isInit = false;
        });
      });
    }
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    final fullHeight = MediaQuery.of(context).size.height;
    final quote = Provider.of<QuoteProvider>(context, listen: false).quoteListe;
    final theIndex = Provider.of<QuoteProvider>(context, listen: true).index;
    final long = Provider.of<QuoteProvider>(context, listen: true).long;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Container(
            width: fullWidth,
            height: fullHeight * 0.75,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/quoteefy.jpg'),
                fit: BoxFit.cover,
              ),
              color: Colors.amber,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Consumer<QuoteProvider>(
                          builder: (context, value, child) {
                            return _isInit
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    quote[theIndex].quote.toString(),
                                    style: GoogleFonts.spirax(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.white,
                  //   height: 30,
                  // ),
                  Expanded(
                    child: Column(
                      children: [
                        Consumer<QuoteProvider>(
                          builder: (context, value, child) {
                            return Text(
                              _isInit ? 'loading' : quote[theIndex].author,
                              style: GoogleFonts.spirax(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.4),
                              ),
                              child: const Icon(
                                Icons.share_rounded,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.4),
                              ),
                              child: const Icon(
                                Icons.category_rounded,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.4),
                              ),
                              child: const Icon(
                                Icons.share_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: fullHeight * 0.055,
          ),
          ButtonNext(fullWidth: fullWidth),
        ],
      ),
    );
  }
}
