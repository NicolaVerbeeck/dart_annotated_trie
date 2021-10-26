import 'package:annotated_trie/annotated_trie.dart';
import 'package:test/test.dart';

void main() {
  group('Trie tests', () {
    test('Test case sensitive', () {
      final trie = AnnotatedTrie<int>(caseInsensitive: false)
        ..addWord('Some', 1)
        ..addWord('body', 2)
        ..addWord('OnCe', 3)
        ..addWord('some', 4)
        ..addWord('something', 5)
        ..addWord('Something', 6);

      expect(trie.findPrefix('som'), [4, 5]);
      expect(trie.findPrefix('Some'), [1, 6]);
      expect(trie.findPrefix('somet'), [5]);
      expect(trie.findPrefix('soMet'), <int>[]);
      expect(trie.findPrefix('Bo'), <int>[]);
      expect(trie.findPrefix('On'), [3]);
      expect(trie.findPrefix('Onc'), <int>[]);
      expect(trie.findPrefix('OnC'), [3]);
    });
    test('Test case insensitive', () {
      final trie = AnnotatedTrie<int>(caseInsensitive: true)
        ..addWord('Some', 1)
        ..addWord('body', 2)
        ..addWord('OnCe', 3)
        ..addWord('something', 4);

      expect(trie.findPrefix('som'), [1, 4]);
      expect(trie.findPrefix('Some'), [1, 4]);
      expect(trie.findPrefix('somet'), [4]);
      expect(trie.findPrefix('soMet'), [4]);
      expect(trie.findPrefix('Bo'), [2]);
      expect(trie.findPrefix('On'), [3]);
      expect(trie.findPrefix('Onc'), [3]);
      expect(trie.findPrefix('OnC'), [3]);
    });
  });
}
