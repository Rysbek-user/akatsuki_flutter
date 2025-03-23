import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/akatsuki_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = AkatsukiCubit()..getAkatsuki();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Akatsuki List'),
        ),
        body: BlocBuilder<AkatsukiCubit, AkatsukiState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is AkatsukiDataSuccess) {
              return ListView.separated(
                itemCount: state.list.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final akatsuki = state.list[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      akatsuki.images.isNotEmpty
                          ? Image.network(
                        akatsuki.images.first,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error, size: 100),
                      )
                          : const Icon(Icons.image_not_supported, size: 100),
                      const SizedBox(height: 8),
                      Text(
                        akatsuki.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              );
            } else if (state is AkatsukiDataLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: Text('Failed to load data'));
            }
          },
        ),
      ),
    );
  }
}