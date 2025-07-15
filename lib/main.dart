import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/advice/presentation/pages/advice_page.dart';
import 'features/advice/presentation/cubit/advice_cubit.dart';
import 'features/advice/data/repository/advice_repo.dart';
import 'features/advice/data/datasource/advice_remote_datasource.dart';

void main() {
  runApp(const AdviceApp());
}

class AdviceApp extends StatelessWidget {
  const AdviceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advice App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: BlocProvider(
        create: (_) => AdviceCubit(AdviceRepo(AdviceRemoteDatasource())),
        child: const AdvicePage(),
      ),
    );
  }
}
