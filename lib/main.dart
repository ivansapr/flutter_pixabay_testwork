import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_work/services/file_service.dart';

import './repositories/images_repository_interface.dart';
import './screens/home_screen.dart';
import './services/pixabay_service.dart';
import 'repositories/images_repository.dart';
import 'routes.dart';
import 'theme.dart';

void main() {
  final bixabay = '18086804-bba8437bcaf73aa3284fc2fd1';

  final imagesService = PixabayService(bixabay);
  final filesService = FileService();

  runApp(
    RepositoryProvider<ImagesRepositoryInterface>(
      create: (context) => ImagesRepository(
        imageService: imagesService,
        fileService: filesService,
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixabay Test',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
