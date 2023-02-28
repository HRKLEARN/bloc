import 'package:clean_architecture_bloc_firebase/presentation/blocs/auth/auth_bloc.dart';
import 'package:clean_architecture_bloc_firebase/data/repositories/auth_repository.dart';
import 'package:clean_architecture_bloc_firebase/presentation/screens/home_screen.dart';
import 'package:clean_architecture_bloc_firebase/presentation/screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                // If the snapshot has user data, then they're already signed in. So Navigating to the HomePage.
                if (snapshot.hasData) {
                  return const HomeScreen();
                }
                // Otherwise, they're not signed in. Show the signIn page.
                return const SignIn();
              }),
        ),
      ),
    );
  }
}