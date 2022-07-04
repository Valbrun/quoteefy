import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteefy/model/quote_modele.dart';
import 'package:http/http.dart' as http;

class QuoteProvider with ChangeNotifier {
  List<Quote> _quoteListe = [];
  int _index = 0;

  List<Quote> get quoteListe => _quoteListe;
  int get index => _index;
  int get long => _quoteListe.length;

  int getQuoteListLength() {
    return _quoteListe.length;
  }

  void setIndex() {
    _index++;
    _index = _index >= _quoteListe.length ? 0 : _index;
    notifyListeners();
  }

  Future<void> fetchAlbum() async {
    const url = 'https://type.fit/api/quotes';
    try {
      final response = await http.get(Uri.parse(url));
      final extracted = json.decode(response.body) as List<dynamic>;
      extracted.forEach((value) {
        _quoteListe
            .add(Quote(value['text'].toString(), value['author'].toString()));
      });
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
