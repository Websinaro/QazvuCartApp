import 'dart:async';
import 'package:flutter/material.dart';
import '../webview/webview_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 800),(){
        if (!mounted) return;
        Navigator.of(context).pushReplacement( MaterialPageRoute(
              builder: (_) => const WebViewScreen(),
            )
        );
      },
    );
  }
    
  @override
  Widget build(BuildContext context){
    return const Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.shopping_cart_rounded,
            size: 72,
          ),
        
          SizedBox(height: 20),
        
          Text(
            'QazvuCart',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
                        
          SizedBox(height: 12),
                        
          CircularProgressIndicator(),
                    
          ],
        ),
      ),
    );
  }
}