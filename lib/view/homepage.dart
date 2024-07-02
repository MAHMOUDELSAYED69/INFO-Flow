import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:infoflow/constant/colors.dart';
import 'package:infoflow/extentions/extentions.dart';
import '../provider/news_provider.dart';
import '../provider/theme_provider.dart';
import '../widgets/category_list_view.dart';
import '../widgets/news_list_view.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      endDrawer: SizedBox(
        height: 80.h,
        child: Drawer(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          child: Center(
            child: SwitchListTile(
              title: Text(
                "Theme Mode",
                style: context.textTheme.bodyMedium,
              ),
              value: theme == ThemeEnum.dark,
              onChanged: (value) {
                ref.read(themeProvider.notifier).toggleTheme();
              },
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "INFO ",
                style: context.textTheme.bodyLarge,
              ),
              TextSpan(
                text: "Flow",
                style: context.textTheme.bodyLarge
                    ?.copyWith(color: ColorManager.yellow),
              ),
            ],
          ),
        ),
      ),
      body: LiquidPullToRefresh(
        animSpeedFactor: 2,
        color: ColorManager.yellow,
        onRefresh: () async => ref.refresh(newsProvider('general')),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CategoryListView(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              sliver: const NewsListView(),
            ),
          ],
        ),
      ),
    );
  }
}
