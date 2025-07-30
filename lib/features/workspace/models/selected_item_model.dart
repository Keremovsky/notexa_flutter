enum SelectedItemType { note, document, none }

class SelectedItem {
  final SelectedItemType type;
  final int id;

  SelectedItem({required this.type, required this.id});
}
