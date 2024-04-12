import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rhymerr/ui/widgets/rhyme_list_card.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            title: Text("Избранное"),
            surfaceTintColor: Colors.transparent,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverList.builder(
            itemBuilder: ((context, index) => RhymeListCard(
                  rhyme: "rhymer",
                  isFavorite: true,
                  sourceWord: "Word",
                )),
          ),
        ],
      ),
    );
  }
}
