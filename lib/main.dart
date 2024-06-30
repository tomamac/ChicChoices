import 'package:chic_choices/1utils/hard_coded_data.dart';
import 'package:chic_choices/features/authentication/pages/loginPage.dart';
import 'package:chic_choices/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:chic_choices/firebase_options.dart';
import 'package:chic_choices/states/authentication/forgetpassword_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  HardCodedData.generateHardCodedData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgetPasswordState(),
      child: GetMaterialApp(
        title: 'Chic Choices',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF6C273)),
          fontFamily: GoogleFonts.inter().fontFamily,
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: const Color(0xFFE59B57),
            filled: true,
          ),
        ),
        home: const loginPage(),
      ),
    );
  }
}
