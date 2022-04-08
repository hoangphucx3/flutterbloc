import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'volume_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VolumeBloc(),
      child: const MaterialApp(
        home: VolumePage(),
      ),
    );
  }
}

class VolumePage extends StatelessWidget {
  const VolumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc'),
      ),
      body: BlocBuilder<VolumeBloc, int>(
        builder: (context, volume) {
          return Center(
            child: Text(
              'Volume: $volume',
              style: const TextStyle(fontSize: 30),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.volume_up),
            onPressed: () {
              context.read<VolumeBloc>().add(VolumeUp());
            },
          ),
          FloatingActionButton(
            child: const Icon(Icons.volume_down),
            onPressed: () {
              context.read<VolumeBloc>().add(VolumeDown());
            },
          ),
          FloatingActionButton(
            child: const Icon(Icons.volume_mute),
            onPressed: () {
              context.read<VolumeBloc>().add(VolumeMute());
            },
          ),
        ],
      ),
    );
  }
}
