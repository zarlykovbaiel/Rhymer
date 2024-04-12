import 'package:flutter/material.dart';
import 'package:rhymerr/ui/widgets/base_container.dart';

class RhymeHistoryCard extends StatelessWidget {
  const RhymeHistoryCard({
    super.key,
    required this.rhyme,
  });

  final List<String> rhyme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BaseContainer(
      width: 200,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cлово",
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          Flexible(
            child: Text(
              rhyme.asMap().entries.map((e) {
                final sb = StringBuffer();
                sb.write(e.value);
                if (e.key != rhyme.length - 1) {
                  sb.write(",  ");
                }
                return sb.toString();
              }).join(),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          )
          // Wrap(
          //     children: rhyme
          //         .map((e) => Padding(
          //             padding: const EdgeInsets.only(right: 4), child: Text(e)))
          //         .toList())
        ],
      ),
    );
  }
}
