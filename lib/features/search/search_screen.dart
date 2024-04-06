import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rhymerr/features/home/home_screen.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          title: Text("Rhymer"),
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(70), child: SearchButton()),
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
            itemBuilder: ((context, index) => const RhymeListCard())),
      ],
    );
  }
}
