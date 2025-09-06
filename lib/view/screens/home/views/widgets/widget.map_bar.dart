import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

import '../../../../../../../../utils/utils.dart';
import '../../../../../utils/api_status/api_status.dart';
import '../../../../common/widgets/api_status_builder.dart';
import '../../../../common/widgets/api_status_listener.dart';
import '../../../../common/widgets/app.text.dart';
import '../../../../common/widgets/in_app_notification.dart';
import '../../controller/controller.map_widget.dart';
import '../../model/view_model.search_location.dart';

class MapBar extends StatefulWidget {
  const MapBar({
    this.suggestionsPosition = SearchSuggestionPosition.bottom,
    this.onSuggestionTap,
    this.debounceDelay = const Duration(seconds: 1),
    super.key,
  });

  final Duration debounceDelay;

  final SearchSuggestionPosition suggestionsPosition;
  final void Function(LocationSearchModel item)? onSuggestionTap;

  @override
  State<MapBar> createState() => _MapBarState();
}

class _MapBarState extends State<MapBar> {
  late final Debouncer deBouncer;
  final _controller = Get.find<MapWidgetController>();
  final _textEditingController = TextEditingController();

  ThemeData get _themeData => Theme.of(context);

  Color get _foregroundColor => _themeData.colorScheme.surface;

  Color get _backgroundColor => _themeData.colorScheme.onSurface;
  Color get _ambientColor => _themeData.colorScheme.inversePrimary;

  @override
  void initState() {
    super.initState();
    deBouncer = Debouncer(delay: widget.debounceDelay);
  }

  void _search() {
    if (_textEditingController.text.isNotEmpty) {
      _controller.searchLocation(_textEditingController.text);
    }
  }

  @override
  Widget build(final BuildContext context) => Obx(
    () => AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeInOut,
      alignment: widget.suggestionsPosition == SearchSuggestionPosition.bottom
          ? Alignment.topCenter
          : Alignment.bottomCenter,
      padding: ResponsiveUtils.horizontalPadding(context).add(
        _controller.isFullScreen.value
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(
                horizontal: AppSizes.points_32,
              ).add(const EdgeInsetsGeometry.only(top: AppSizes.points_32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        verticalDirection: _resolveSuggestionPosition,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 380),

            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(AppSizes.points_4),
            decoration: BoxDecoration(
              color: _backgroundColor.withValues(alpha: 0.7),
              borderRadius: _controller.isFullScreen.value
                  ? null
                  : BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                Expanded(child: _searchBar),
                EndDrawerButton(color: _foregroundColor),
              ],
            ),
          ),
          if (_controller.searchLocationStatus.value is! IdleApiStatus)
            _buildSuggestions,
        ],
      ),
    ),
  );

  Widget get _buildSuggestions => Container(
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height / 3,
    ),
    margin: const EdgeInsets.symmetric(
      horizontal: AppSizes.points_8,
      vertical: AppSizes.points_4,
    ),
    padding: const EdgeInsets.all(AppSizes.points_4),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      border: Border.all(color: _ambientColor.withValues(alpha: 0.4), width: 2),
      color: _backgroundColor.withValues(alpha: 0.5),
    ),
    child: ApiStatusListener(
      apiStatus: _controller.searchLocationStatus,
      onFailure: (final failure) => InAppNotification.error(
        message: failure.message ?? 'Error while searching',
      ).show(),
      child: ApiStatusBuilder(
        apiStatus: _controller.searchLocationStatus,
        onRetry: _search,
        onLoading: (final progress) => _buildSearchMessage('درحال جستجو ...'),
        onSuccess: (final searchResult) => searchResult.isEmpty
            ? _buildSearchMessage(' موردی یافت نشد.')
            : ListView.builder(
                shrinkWrap: true,
                itemCount: searchResult.length,
                itemBuilder: (final context, final index) {
                  final item = searchResult[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Material(
                      type: MaterialType.button,
                      color: _ambientColor.withValues(alpha: 0.4),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: InkWell(
                        onTap: () {
                          _clearSuggestions(clearText: true);
                          widget.onSuggestionTap?.call(item);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.points_8,
                            vertical: AppSizes.points_4,
                          ),
                          child: AppText(
                            item.displayName,
                            maxLines: 2,
                            style: _themeData.textTheme.bodyMedium?.copyWith(
                              color: _themeData.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    ),
  );

  void _clearSuggestions({final bool clearText = true}) {
    if (clearText) {
      _textEditingController.clear();
    }
    _controller.clearSearchResults();
  }

  Widget _buildSearchMessage(final String message) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.points_16,
          vertical: AppSizes.points_32,
        ),
        child: AppText.bodyMedium(
          message,
          mergeWith: TextStyle(color: _foregroundColor),
        ),
      ),
    ],
  );

  VerticalDirection get _resolveSuggestionPosition =>
      widget.suggestionsPosition == SearchSuggestionPosition.bottom
      ? VerticalDirection.down
      : VerticalDirection.up;

  Widget get _searchBar {
    Widget searchButton() => IconButton(
      onPressed: _search,
      icon: Icon(
        Icons.location_on_rounded,
        color: _ambientColor,
        size: AppSizes.points_32,
      ),
    );

    Widget clearButton() => IconButton(
      onPressed: _clearSuggestions,
      icon: Icon(Icons.clear, color: _foregroundColor),
    );

    return ValueListenableBuilder(
      valueListenable: _textEditingController,
      builder: (final context, final value, final child) => TextFormField(
        controller: _textEditingController,
        textDirection: Utils.estimateDirectionOfText(value.text),
        autofocus: false,
        style: _themeData.textTheme.bodyLarge?.copyWith(
          color: _foregroundColor,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: _themeData.colorScheme.onSurface.withValues(alpha: 0.8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(
              color: _ambientColor.withValues(alpha: 0.4),
              width: 2,
            ),
          ),

          hintText: 'جستجوی موقعیت مکانی',
          hintStyle: _themeData.textTheme.bodyMedium?.copyWith(
            color: _foregroundColor,
          ),

          suffixIcon: value.text.isEmpty ? null : clearButton(),
          prefixIcon: ApiStatusBuilder(
            apiStatus: _controller.searchLocationStatus,
            onLoading: (final progress) => const Padding(
              padding: EdgeInsets.all(AppSizes.points_8),
              child: SizedBox.square(
                dimension: AppSizes.points_24,
                child: CircularProgressIndicator(),
              ),
            ),
            onRetry: searchButton,
            onIdle: searchButton,
            onSuccess: (final _) => searchButton(),
          ),
        ),
        onFieldSubmitted: (final _) => _search(),
        onChanged: (final _) {
          deBouncer.call(_search);
        },
      ),
    );
  }
}

enum SearchSuggestionPosition { top, bottom }
