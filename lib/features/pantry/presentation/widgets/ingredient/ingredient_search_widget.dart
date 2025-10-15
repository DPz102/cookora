// lib/features/pantry/presentation/widgets/ingredient/ingredient_search_widget.dart
import 'dart:async';
import 'dart:developer';
import 'package:algoliasearch/algoliasearch_lite.dart';
import 'package:cookora/core/config/app_config.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';
import 'package:cookora/core/widgets/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IngredientSearchWidget extends StatefulWidget {
  final ValueChanged<Ingredient> onIngredientSelected;

  const IngredientSearchWidget({super.key, required this.onIngredientSelected});

  @override
  State<IngredientSearchWidget> createState() => _IngredientSearchWidgetState();
}

class _IngredientSearchWidgetState extends State<IngredientSearchWidget> {
  final _searchController = TextEditingController();

  final SearchClient _searchClient = SearchClient(
    appId: AppConfig.algoliaAppId,
    apiKey: AppConfig.algoliaSearchKey,
  );

  List<Ingredient> _hits = [];
  bool _isLoading = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _performSearch(_searchController.text);
    });
  }

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        _hits = [];
        _isLoading = false;
      });
      return;
    }
    setState(() => _isLoading = true);

    try {
      final response = await _searchClient.searchIndex(
        request: SearchForHits(
          indexName: AppConfig.algoliaIndexName,
          query: query,
        ),
      );

      final ingredients = response.hits.map((hit) {
        final data = {...hit};
        return Ingredient.fromJson(data);
      }).toList();

      if (mounted) {
        setState(() {
          _hits = ingredients;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
      log('Algolia search error: $e');
    }
  }

  void clearSearch() {
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.w),
          child: TextField(
            controller: _searchController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Tìm kiếm tên nguyên liệu...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _isLoading ? const CircularProgressIndicator() : null,
            ),
          ),
        ),
        Expanded(
          child: _hits.isEmpty && !_isLoading
              ? const EmptyStateWidget(
                  icon: Icons.search,
                  title: 'Tìm kiếm nguyên liệu',
                  subtitle: 'Gõ để tìm kiếm nguyên liệu trong kho dữ liệu.',
                )
              : ListView.builder(
                  itemCount: _hits.length,
                  itemBuilder: (context, index) {
                    final ingredient = _hits[index];
                    return ListTile(
                      title: Text(
                        ingredient.name,
                        style: theme.textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        ingredient.category,
                        style: theme.textTheme.bodySmall,
                      ),
                      onTap: () => widget.onIngredientSelected(ingredient),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
