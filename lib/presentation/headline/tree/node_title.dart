import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/domain/model/tree_object.dart';
import 'package:madagascar_workcoode/presentation/headline/article/article_card.dart';

class NodeTitle extends StatelessWidget {
  final TreeNode<TreeObject> node;

  const NodeTitle({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    if (node.isRoot) {
      return const SizedBox.shrink();
    }
    if (node.data is! Article) {
      final bool isParentNode = node.children.isNotEmpty;
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isParentNode)
              CircleAvatar(
                maxRadius: 10,
                child: Icon(
                  node.isExpanded ? Icons.remove : Icons.add,
                  size: 16,
                ),
              ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                node.data!.getTreeTitle(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }
    final article = node.data as Article;
    return ArticleCard(article: article);
  }
}
