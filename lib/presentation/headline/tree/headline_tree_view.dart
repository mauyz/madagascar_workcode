import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/tree_object.dart';
import 'package:madagascar_workcoode/presentation/headline/tree/node_title.dart';

class HeadlineTreeView extends StatelessWidget {
  final TreeNode<TreeObject> tree;

  const HeadlineTreeView({
    super.key,
    required this.tree,
  });

  @override
  Widget build(BuildContext context) {
    return TreeView.simple(
      tree: tree,
      showRootNode: false,
      expansionIndicatorBuilder: (context, node) => ChevronIndicator.rightDown(
        tree: node,
        color: Colors.transparent,
      ),
      indentation: const Indentation(style: IndentStyle.roundJoint),
      builder: (context, item) {
        return NodeTitle(node: item);
      },
    );
  }
}
