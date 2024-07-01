import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectx/cache/cache.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeEnum>((ref) {
  return ThemeNotifier();
});

enum ThemeEnum { light, dark }

class ThemeNotifier extends StateNotifier<ThemeEnum> {
  ThemeNotifier() : super(_loadThemeFromCache());

  void toggleTheme() {
    state = state == ThemeEnum.light ? ThemeEnum.dark : ThemeEnum.light;
    _saveThemeToCache(state);
  }

  static ThemeEnum _loadThemeFromCache() {
    int themeIndex = CacheData.getData(key: 'theme') ?? 0;
    return ThemeEnum.values
        .elementAt(themeIndex.clamp(0, ThemeEnum.values.length - 1));
  }

  void _saveThemeToCache(ThemeEnum theme) async {
    await CacheData.setData(key: 'theme', value: theme.index);
  }
}
