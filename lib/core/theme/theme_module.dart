import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../core/abstract_module.dart';
import 'app_theme.dart';

class ThemeModule extends AbstractModule {
  static final ThemeModule instance = ThemeModule._init();

  factory ThemeModule() {
    return instance;
  }

  ThemeModule._init() : super();

  @override
  void configure(Injector injector) {
    injector.map<Contemporary>((i) => Contemporary(), isSingleton: true);
  }
}
