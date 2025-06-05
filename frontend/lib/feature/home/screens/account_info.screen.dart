import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/injection/injection_container.dart';
import '../bloc/user_details/user_details_bloc.dart';
import '../bloc/user_details/user_details_event.dart';
import '../bloc/user_details/user_details_state.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserDetailsBloc>()..add(const UserDetailsEvent.getUserDetails()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Account Info'),
        ),
        body: BlocBuilder<UserDetailsBloc, UserDetailsState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (userData) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${userData.name}'),
                    const SizedBox(height: 8),
                    Text('Email: ${userData.email}'),
                    // Add more user details as needed
                  ],
                ),
              ),
              error: (message) => Center(
                child: Text('Error: $message'),
              ),
              networkError: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Network Error: $message'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<UserDetailsBloc>().add(
                              const UserDetailsEvent.getUserDetails(),
                            );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              orElse: () => const Center(child: Text('Something went wrong')),
            );
          },
        ),
      ),
    );
  }
}