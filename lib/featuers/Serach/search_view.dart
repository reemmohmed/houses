import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houses/featuers/home/presentation/data/logic/cubit/home_cubit.dart';
import 'package:houses/featuers/home/presentation/views/home_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String query) {
    final trimmedQuery = query.trim();
    if (trimmedQuery.isNotEmpty) {
      context.read<HomeCubit>().searchProducts(trimmedQuery);
    } else {
      context.read<HomeCubit>().fetchProducts();
    }
  }

  @override
  void initState() {
    super.initState();
    // هنا نستخدم listener لما ال SearchBar يتغير النص
    _searchController.addListener(() {
      _onSearchChanged(_searchController.text);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().fetchProducts();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
          child: Column(
            children: [
              SearchBar(
                controller: _searchController,
                hintText: 'Search...',
                leading: const Icon(Icons.search),
                // ممكن تضيف onChanged لو عايز تدي استجابة أسرع بدون listener
                onChanged: (value) {
                  _onSearchChanged(value);
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeSucsess) {
                      final products = state.products;
                      if (products.isEmpty) {
                        return const Center(child: Text('No results found'));
                      }
                      return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomStacImage(product: product),
                          );
                        },
                      );
                    } else if (state is HomeError) {
                      return Center(child: Text('Error: ${state.message}'));
                    }
                    return const Center(child: Text('Type to search products'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
