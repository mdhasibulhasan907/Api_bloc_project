import 'package:api_bloc_product/feature/product/data/repository/product_repositoryImolement.dart';
import 'package:api_bloc_product/feature/product/data/usecase/product_use_case.dart';
import 'package:api_bloc_product/feature/product/presentation/product_bloc.dart';
import 'package:api_bloc_product/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>ProductBloc(ProductUseCase(ProductRepositoryImplement()))),
        ],

        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home: ProductScreen()
        )

    );
  }
}
