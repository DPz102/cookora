// lib/features/pantry/presentation/widgets/ingredient/ingredient_search_widget.dart
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:algoliasearch/algoliasearch_lite.dart';

import 'package:cookora/core/config/app_config.dart';
import 'package:cookora/core/widgets/empty_state_widget.dart';
import 'package:cookora/features/pantry/domain/entities/ingredient.dart';

class IngredientSearchWidget extends StatefulWidget {
  final ValueChanged<Ingredient> onIngredientSelected;

  // >> THAY ĐỔI: Thêm key <<
  const IngredientSearchWidget({super.key, required this.onIngredientSelected});

  // >> THAY ĐỔI: Tạo State class public <<
  @override
  IngredientSearchWidgetState createState() => IngredientSearchWidgetState();
}

// >> THAY ĐỔI: State class public để có thể truy cập từ bên ngoài qua GlobalKey <<
class IngredientSearchWidgetState extends State<IngredientSearchWidget> {
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

  // >> THÊM: Method public để xóa text và reset state <<
  void clearSearch() {
    _searchController.clear();
    // Việc controller clear sẽ tự động trigger _onSearchChanged và reset UI
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
              // Hiển thị nút 'x' để xóa nhanh
              suffixIcon: _isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2.5),
                      ),
                    )
                  : (_searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: clearSearch,
                          )
                        : null),
            ),
          ),
        ),
        Expanded(
          child:
              _hits.isEmpty &&
                  !_isLoading &&
                  _searchController.text.trim().isNotEmpty
              ? const EmptyStateWidget(
                  icon: Icons.search_off_rounded,
                  title: 'Không tìm thấy',
                  subtitle:
                      'Không có nguyên liệu nào khớp với từ khóa của bạn.',
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
