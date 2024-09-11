import 'package:flutter/material.dart';
import 'package:sanad/cubit/auth_cubit.dart';
import 'package:sanad/cubit/home_cubit.dart';
import 'package:sanad/routes/activity.dart';
import 'package:sanad/routes/sing_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/services/apiService.dart';

void main() {
  final ApiService apiService = ApiService();
  runApp(MyApp(apiService: apiService));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;
  const MyApp({super.key, required this.apiService});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(apiService)..checkSignInStatus()),
        BlocProvider(create: (_) => HomeCubit(apiService)),
      ],
      child: MaterialApp(
        title: 'sanad',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => BlocBuilder<AuthCubit, bool>(
                builder: (context, isSignedIn) {
                  if (isSignedIn) {
                    context.read<HomeCubit>().loadData();
                    return const ActivityPage();
                  } else {
                    return SignInPage();
                  }
                },
              ),
          '/home': (context) => const ActivityPage(),
        },
      ),
    );
  }
}
