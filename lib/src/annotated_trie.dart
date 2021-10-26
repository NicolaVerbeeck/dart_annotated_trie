///Trie data structure for accessing related data based on prefix.
///Note: This trie is non-sorting, the data is returned in any order
class AnnotatedTrie<T> {
  final bool caseInsensitive;
  final bool allowDuplicateKeys;
  final _head = _TrieNode<T>();

  ///Create a new annotated trie. [caseInsensitive] marks this trie as ignoring casing or not
  ///[allowDuplicateKeys] controls if duplicate keys are accepted
  AnnotatedTrie(
      {required this.caseInsensitive, this.allowDuplicateKeys = false});

  ///Adds a word to the trie and associate the given data with it.
  ///Duplicate words will be overwritten if [allowDuplicateKeys] is false.
  ///(Note: this is affected by the [caseInsensitive] flag)
  void addWord(String word, T data) {
    assert(word.isNotEmpty);

    final toAdd = caseInsensitive ? word.toLowerCase() : word;

    _internalAdd(toAdd, data, _head);
  }

  ///Find all nodes prefixed/matching the given input string and return the data
  ///Note: The data is sorted arbitrarily
  List<T> findPrefix(String prefix) {
    if (prefix.isEmpty) return List.empty();

    final toSearch = caseInsensitive ? prefix.toLowerCase() : prefix;
    final chars = toSearch.codeUnits;

    var i = 0;
    _TrieNode<T>? current = _head;
    while (i < chars.length && current != null) {
      current = current.children[chars[i++]];
    }

    if (current == null) return List.empty();
    final values = <T>[];
    _collect(current, values);
    return values;
  }

  void _collect(_TrieNode<T> node, List<T> into) {
    final thisData = node.data;
    if (thisData != null) into.add(thisData);
    if (node.duplicateData != null) into.addAll(node.duplicateData!);
    node.children.forEach((_, node) {
      _collect(node, into);
    });
  }

  void _internalAdd(String word, T data, _TrieNode into) {
    final first = word.substring(0, 1);
    final remaining = word.substring(1);

    final childNode =
        into.children.putIfAbsent(first.codeUnits[0], () => _TrieNode<T>());

    if (remaining.isEmpty) {
      if (!allowDuplicateKeys) {
        childNode.data = data;
      } else if (childNode.data == null) {
        childNode.data = data;
      } else {
        childNode.duplicateData = (childNode.duplicateData ?? <T>[])..add(data);
      }
    } else {
      _internalAdd(remaining, data, childNode);
    }
  }
}

class _TrieNode<T> {
  final children = <int, _TrieNode<T>>{};
  T? data;
  List<T>? duplicateData;

  _TrieNode();
}
