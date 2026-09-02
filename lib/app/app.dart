import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../features/splash/splash_screen.dart';
import 'theme.dart';

class QazvuCart extends StatelessWidget{
    const QazvuCart({super.key});
    
    @override
    Widget build(BuildContest contest) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConfig.appName,
            theme: AppTheme.light,
            home: const SplashScreen(),
        );
    }
}
