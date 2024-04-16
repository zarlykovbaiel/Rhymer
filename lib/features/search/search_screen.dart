import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rhymerr/features/search/widgets/search_buttom.dart';
import 'package:rhymerr/features/search/widgets/search_rhymes_bottom_sheet.dart';
import 'package:rhymerr/ui/widgets/rhyme_history_card.dart';
import 'package:rhymerr/ui/widgets/rhyme_list_card.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          title: const Text("Rhymer"),
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: SearchButton(
              onTap: () {
                _searchShowBottomSheet(context);
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
              itemBuilder: ((context, index) {
                final rhyme = List.generate(4, (index) => "Рифма $index");
                return RhymeHistoryCard(rhyme: rhyme);
              }),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverList.builder(
            itemBuilder: ((context, index) => const RhymeListCard(
                  rhyme: "Rhymer",
                ))),
      ],
    );
  }

  void _searchShowBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => const Padding(
        padding: EdgeInsets.only(top: 60.0),
        child: SearchRhymesBottomSheet(),
      ),
    );
  }
}
