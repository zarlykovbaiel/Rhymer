import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhymerr/ui/widgets/base_container.dart';

class SettingToggleCard extends StatelessWidget {
  const SettingToggleCard({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
      child: BaseContainer(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 18),
              ),
              CupertinoSwitch(value: value, onChanged: onChanged)
            ],
          )),
    );
  }
}
