import 'package:flutter/material.dart';
import 'package:project/models/ranking_item.dart';

class TopListElement extends StatelessWidget {
  const TopListElement({
    super.key,
    required this.item,
  });

  final RankingItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: const Color.fromRGBO(18, 19, 20, 1),
      tileColor: Colors.white,
      leading: Text(
        '${item.rank}',
        style: TextStyle(
            color: Colors.grey[400],
            fontFamily: 'Halenoir',
            fontWeight: FontWeight.w300,
            fontSize: 15),
      ),
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(item.avatarUrl),
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Halenoir',
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                item.points,
                style: TextStyle(
                    color: Colors.grey[200],
                    fontFamily: 'Halenoir',
                    fontWeight: FontWeight.w300,
                    fontSize: 13),
              ),
            ],
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '1',
            style: TextStyle(
              color: item.hasAdvanced ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            item.hasAdvanced
                ? Icons.arrow_drop_up
                : Icons.arrow_drop_down,
            color: item.hasAdvanced ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }
}
