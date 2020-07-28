import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Padding( 
      padding: EdgeInsets.all(10),
      child: Text(wordPair.toString()),
    );
  }
}