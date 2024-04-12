import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rhymerr/features/settings/widgets/settings_toggle_card.dart';
import 'package:rhymerr/ui/widgets/base_container.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            title: Text("Настройки"),
            surfaceTintColor: Colors.transparent,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingToggleCard(
              title: "Темная темa",
              value: false,
              onChanged: (value) => {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingToggleCard(
              title: "Уведомление",
              value: false,
              onChanged: (value) => {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingToggleCard(
              title: "Разрешить аналитику",
              value: true,
              onChanged: (value) => {},
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
              child: SettingsActionsCard(
            title: "Очистить историю",
            iconData: Icons.delete_outline,
            iconColor: Theme.of(context).primaryColor,
            onTap: () {},
          )),
          SliverToBoxAdapter(
              child: SettingsActionsCard(
            title: "Поддержка",
            iconData: Icons.message_outlined,
            onTap: () {},
          )),
        ],
      ),
    );
  }
}

class SettingsActionsCard extends StatelessWidget {
  const SettingsActionsCard({
    super.key,
    required this.title,
    this.onTap,
    required this.iconData,
    this.iconColor,
  });

  final String title;
  final VoidCallback? onTap;
  final IconData iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    iconData,
                    color: iconColor ?? theme.hintColor,
                    size: 32,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
