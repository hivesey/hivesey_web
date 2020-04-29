import 'package:flutter_simple_dependency_injection/injector.dart';

abstract class AbstractModule {
  final Injector _injector = Injector.getInjector();
  void configure(Injector injector);

  AbstractModule() {
    this.configure(_injector);
  }

  T get<T>({String key, Map<String, dynamic> additionalParameters}) {
    return _injector.get(key: key, additionalParameters: additionalParameters);
  }
}
