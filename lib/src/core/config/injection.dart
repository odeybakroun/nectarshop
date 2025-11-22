library dependency_injection;

import 'package:flutter/material.dart';
import 'package:nectarshop/src/core/config/config.dart';

class DependencyInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    diRegister();
  }
}
