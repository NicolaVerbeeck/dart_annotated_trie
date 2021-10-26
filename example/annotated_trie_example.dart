import 'package:annotated_trie/annotated_trie.dart';

void main() {
  final trie = AnnotatedTrie<int>(caseInsensitive: false)
    ..addWord('Some', 1)
    ..addWord('body', 2)
    ..addWord('OnCe', 3)
    ..addWord('some', 4)
    ..addWord('something', 5)
    ..addWord('Something', 6);

  //ignore: avoid_print
  print('Finding prefix for "som": ${trie.findPrefix('som')}');
  //ignore: avoid_print
  print('Finding prefix for "Some": ${trie.findPrefix('Some')}');
  //ignore: avoid_print
  print('Finding prefix for "somet": ${trie.findPrefix('somet')}');
  //ignore: avoid_print
  print('Finding prefix for "soMet": ${trie.findPrefix('soMet')}');
  //ignore: avoid_print
  print('Finding prefix for "Bo": ${trie.findPrefix('Bo')}');
  //ignore: avoid_print
  print('Finding prefix for "On": ${trie.findPrefix('On')}');
  //ignore: avoid_print
  print('Finding prefix for "Onc": ${trie.findPrefix('Onc')}');
  //ignore: avoid_print
  print('Finding prefix for "OnC": ${trie.findPrefix('OnC')}');
}
