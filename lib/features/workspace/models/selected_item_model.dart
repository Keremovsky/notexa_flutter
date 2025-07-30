enum SelectedItemType { note, document, none }

class SelectedItem {
  final SelectedItemType type;
  final int id;
  final String name;

  SelectedItem({required this.type, required this.id, required this.name});
}
