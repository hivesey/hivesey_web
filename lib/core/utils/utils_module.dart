import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../core/abstract_module.dart';
import 'url_launch.dart';

class UtilsModule extends AbstractModule {
  static final UtilsModule instance = UtilsModule._init();

  factory UtilsModule() {
    return instance;
  }

  UtilsModule._init() : super();

  @override
  void configure(Injector injector) {
    injector.map<UrlLaunch>((i) => UrlLaunch(), isSingleton: true);
  }
}
