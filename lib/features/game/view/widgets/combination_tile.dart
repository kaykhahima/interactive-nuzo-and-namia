import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:interactive_nuzo_and_namia/features/game/model/combination_model.dart';

class CombinationTile extends StatelessWidget {
  const CombinationTile({super.key, required this.combination});

  final CombinationModel combination;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Look for something that is ',
          style: Theme.of(context).textTheme.headlineSmall,
          children: [
            TextSpan(
              text: '${combination.tags[0]}, '.capitalize,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextSpan(
              text: '${combination.tags[1]} '.capitalize,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextSpan(
              text: 'and makes you ',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextSpan(
              text: '${combination.tags[2]}.'.toLowerCase(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
