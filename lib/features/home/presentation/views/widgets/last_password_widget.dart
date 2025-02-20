import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_gen/features/home/presentation/home_cubit/home_cubit.dart';

class LastPasswordWidget extends StatefulWidget {
  const LastPasswordWidget({super.key});

  @override
  State<LastPasswordWidget> createState() => _LastPasswordWidgetState();
}

class _LastPasswordWidgetState extends State<LastPasswordWidget> {
  bool isPasswordVisible = false; // 🔹 Manages password visibility

  @override
  void initState() {
    super.initState();
    // 🔹 Fetch password from Firestore when widget initializes
    Future.microtask(() => context.read<HomeCubit>().fetchLastPassword());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, homeState) {
        String password = "************";

        if (homeState is LastPasswordVisible) {
          password = homeState.password;
        } else if (homeState is LastPasswordLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (homeState is LastPasswordError) {
          return Text(homeState.message, style: TextStyle(color: Colors.red));
        }

        return Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 73, 89, 97),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Last Generated Password:',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      isPasswordVisible ? password : "************", // 🔹 Show or hide password
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible; // 🔹 Toggle visibility
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
