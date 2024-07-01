import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectx/constant/colors.dart';
import 'package:projectx/extentions/extentions.dart';
import '../provider/theme_provider.dart';
import '../widgets/category_list_view.dart';
import '../widgets/news_list_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "INFO ",
              style: context.textTheme.bodyLarge,
            ),
            Text(
              "Flow",
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: ColorManager.yellow),
            )
          ],
        ),
      ),
      body: CustomScrollView(
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
    );
  }
}
