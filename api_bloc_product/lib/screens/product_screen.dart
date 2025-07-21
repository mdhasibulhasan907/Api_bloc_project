import 'package:api_bloc_product/feature/product/presentation/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/product/presentation/product_event.dart';
import '../feature/product/presentation/product_state.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBloc>();
    if (productBloc.state is ProductInitial) {
      productBloc.add(FetchProductEvent());
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Prouct Details"),
        backgroundColor: Colors.white.withOpacity(.5),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: searchController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter Product ID",
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final idText = searchController.text.trim();
                    final id = int.tryParse(idText);

                    if (id != null) {
                      context.read<ProductBloc>().add(
                        FetchProductByIdEvent(id),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter a valid numeric ID"),
                        ),
                      );
                    }

                  },

                ),


              ),
              onChanged: (value) {
                if (value.trim().isEmpty) {
                  context.read<ProductBloc>().add(FetchProductEvent()); // auto reload all products
                }
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (_, index) {
                      var data = state.products[index];
                      return Card(
                        color: Colors.blue.shade50,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product ID
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: "Product ID: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: "${data.id}"),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Product Title
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: "Title: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: "${data.title}"),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Product Body
                              Text(
                                "${data.body}",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );

                      //ListTile(title: Text("${data.title}"));
                    },
                  );
                }
                return Center(child: Text("No data available"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
