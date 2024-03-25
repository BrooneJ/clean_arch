import 'package:clean_arch/presentation/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;

    return Scaffold(
        appBar: AppBar(
          title: Text('Near By Stores: ${state.stores.length}'),
        ),
        body: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: state.stores.length,
                itemBuilder: (context, index) {
                  final store = state.stores[index];
                  return ListTile(
                    title: Text(store.name),
                    subtitle: Text(store.address),
                    trailing: Text('${store.distance / 1000.0}km'),
                  );
                },
              ));
  }
}
