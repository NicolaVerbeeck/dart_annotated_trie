A trie implementation where you can store arbitrary values in the leaf nodes

## Usage

A simple usage example:

```dart
void main() {
  final trie = AnnotatedTrie<int>(caseInsensitive: false)
    ..addWord('Some', 1)
    ..addWord('body', 2)
    ..addWord('OnCe', 3)
    ..addWord('some', 4)
    ..addWord('something', 5)
    ..addWord('Something', 6);
  
  print('Finding prefix for "Some": ${trie.findPrefix('Some')}');
  print('Finding prefix for "somet": ${trie.findPrefix('somet')}');
}
```