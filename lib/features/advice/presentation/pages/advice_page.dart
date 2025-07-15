import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/advice_cubit.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AdviceCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Advice Generator')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<AdviceCubit, AdviceState>(
            builder: (context, state) {
              if (state is AdviceInitial) {
                return const Text('Press the button to get advice');
              } else if (state is AdviceLoading) {
                return const CircularProgressIndicator();
              } else if (state is AdviceLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.advice,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => cubit.getAdvice(),
                      icon: const Icon(Icons.refresh),
                      label: const Text("Get Another Advice"),
                    ),
                  ],
                );
              } else if (state is AdviceError) {
                return Text(state.message);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cubit.getAdvice(),
        child: const Icon(Icons.lightbulb_outline),
    ),
);
}
}
