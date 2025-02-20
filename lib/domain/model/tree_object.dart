abstract class TreeObject {
  String getTreeTitle();

  @override
  int get hashCode => getTreeTitle().hashCode;

  @override
  bool operator ==(Object other) {
    return hashCode == other.hashCode;
  }
}
