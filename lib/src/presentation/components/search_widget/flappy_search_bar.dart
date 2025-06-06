import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';

import '../../../core/extension/extension.dart';

mixin ControllerListener<T> on State<FlappySearchBar<T>> {
  void onListChanged(List<T> items) {}

  void onLoading() {}

  void onClear() {}

  void onError(Error error) {}
}

class SearchBarController<T> {
  final List<T> _list = [];
  final List<T> _filteredList = [];
  final List<T> _sortedList = [];
  late TextEditingController _searchQueryController;
  String? _lastSearchedText;
  Future<List<T>> Function(String? text)? _lastSearchFunction;
  ControllerListener? _controllerListener;
  int Function(T a, T b)? _lastSorting;
  CancelableOperation? _cancelableOperation;
  late int minimumChars;

  void setTextController(TextEditingController searchQueryController, int minimunChars) {
    _searchQueryController = searchQueryController;
    minimumChars = minimunChars;
  }

  Future<void> setListener(ControllerListener controllerListener) async {
    _controllerListener = controllerListener;
  }

  void clear() {
    _controllerListener?.onClear();
  }

  Future<void> _search(String? text, Future<List<T>> Function(String? text) onSearch) async {
    _controllerListener?.onLoading();
    try {
      if (_cancelableOperation != null && (!_cancelableOperation!.isCompleted || !_cancelableOperation!.isCanceled)) {
        await _cancelableOperation!.cancel();
      }
      _cancelableOperation = CancelableOperation.fromFuture(
        onSearch(text),
        onCancel: () => {},
      );

      final List<T> items = await _cancelableOperation?.value;
      _lastSearchFunction = onSearch;
      _lastSearchedText = text;
      _list.clear();
      _filteredList.clear();
      _sortedList.clear();
      _lastSorting = null;
      _list.addAll(items);
      _controllerListener?.onListChanged(_list);
    } on Exception catch (error) {
      _controllerListener?.onError(error as Error);
    }
  }

  void injectSearch(String? searchText, Future<List<T>> Function(String? text) onSearch) {
    if (searchText != null && searchText.length >= minimumChars) {
      _searchQueryController.text = searchText;
      _search(searchText, onSearch);
    }
  }

  void replayLastSearch() {
    if (_lastSearchFunction != null && _lastSearchedText != null) {
      _search(_lastSearchedText, _lastSearchFunction!);
    }
  }

  void removeFilter() {
    _filteredList.clear();
    if (_lastSorting == null) {
      _controllerListener?.onListChanged(_list);
    } else {
      _sortedList
        ..clear()
        ..addAll(List<T>.from(_list))
        ..sort(_lastSorting);
      _controllerListener?.onListChanged(_sortedList);
    }
  }

  void removeSort() {
    _sortedList.clear();
    _lastSorting = null;
    _controllerListener?.onListChanged(_filteredList.isEmpty ? _list : _filteredList);
  }

  void sortList(int Function(T a, T b) sorting) {
    _lastSorting = sorting;
    _sortedList
      ..clear()
      ..addAll(List<T>.from(_filteredList.isEmpty ? _list : _filteredList))
      ..sort(sorting);
    _controllerListener?.onListChanged(_sortedList);
  }

  void filterList(bool Function(T item) filter) {
    _filteredList
      ..clear()
      ..addAll(_sortedList.isEmpty ? _list.where(filter).toList() : _sortedList.where(filter).toList());
    _controllerListener?.onListChanged(_filteredList);
  }
}

typedef IndexedScaledTileBuilder = Widget Function(int index);

class FlappySearchBar<T> extends StatefulWidget {
  const FlappySearchBar({
    super.key,
    required this.onSearch,
    required this.onItemFound,
    this.searchBarController,
    this.minimumChars = 3,
    this.debounceDuration = const Duration(milliseconds: 500),
    this.loader = const Center(child: CircularProgressIndicator.adaptive()),
    this.onError,
    this.emptyWidget = const SizedBox.shrink(),
    this.header,
    this.placeHolder,
    this.icon = const Icon(Icons.search),
    this.hintText = '',
    this.hintStyle = const TextStyle(color: Color.fromRGBO(142, 142, 147, 1)),
    this.iconActiveColor = Colors.black,
    this.textStyle = const TextStyle(color: Colors.black),
    this.cancellationWidget = const Text('Cancel'),
    this.onCancelled,
    this.suggestions = const [],
    this.buildSuggestion,
    this.crossAxisCount = 1,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.listPadding = EdgeInsets.zero,
    this.searchBarPadding = EdgeInsets.zero,
    this.headerPadding = EdgeInsets.zero,
    this.focusNode,
    this.onFieldTap,
  });

  /// Future returning searched items
  final Future<List<T>> Function(String? text) onSearch;

  /// List of items showed by default
  final List<T> suggestions;

  /// Callback returning the widget corresponding to a Suggestion item
  final Widget Function(T? item, int index)? buildSuggestion;

  /// Minimum number of chars required for a search
  final int minimumChars;

  /// Callback returning the widget corresponding to an item found
  final Widget Function(T? item, int index) onItemFound;

  /// Callback returning the widget corresponding to an Error while searching
  final Widget Function(Error error)? onError;

  /// Cooldown between each call to avoid too many
  final Duration debounceDuration;

  /// Widget to show when loading
  final Widget loader;

  /// Widget to show when no item were found
  final Widget emptyWidget;

  /// Widget to show by default
  final Widget? placeHolder;

  /// Widget showed on left of the search bar
  final Widget icon;

  /// Widget placed between the search bar and the results
  final Widget? header;

  /// Hint text of the search bar
  final String hintText;

  /// TextStyle of the hint text
  final TextStyle hintStyle;

  /// Color of the icon when search bar is active
  final Color iconActiveColor;

  /// Text style of the text in the search bar
  final TextStyle textStyle;

  /// Widget shown for cancellation
  final Widget cancellationWidget;

  /// Callback when cancel button is triggered

  final void Function()? onCancelled;

  /// Focus node
  final FocusNode? focusNode;

  /// Controller used to be able to sort, filter or replay the search
  final SearchBarController? searchBarController;

  /// Number of items displayed on cross axis
  final int crossAxisCount;

  /// Weather the list should take the minimum place or not
  final bool shrinkWrap;

  /// Set the scrollDirection
  final Axis scrollDirection;

  /// Spacing between tiles on main axis
  final double mainAxisSpacing;

  /// Spacing between tiles on cross axis
  final double crossAxisSpacing;

  /// Set a padding on the search bar
  final EdgeInsetsGeometry searchBarPadding;

  /// Set a padding on the header
  final EdgeInsetsGeometry headerPadding;

  /// Set a padding on the list
  final EdgeInsetsGeometry listPadding;

  final VoidCallback? onFieldTap;

  @override
  SearchBarState createState() => SearchBarState<T>();
}

class SearchBarState<T> extends State<FlappySearchBar<T>> with TickerProviderStateMixin, ControllerListener<T> {
  bool _loading = false;
  bool _isTitle = true;
  Widget? _error;
  final _searchQueryController = TextEditingController();
  Timer? _debounce;
  bool animate = false;
  List<T?> _list = [];
  late SearchBarController searchBarController;

  @override
  void initState() {
    super.initState();
    searchBarController = widget.searchBarController ?? SearchBarController<T>();
    searchBarController
      ..setListener(this)
      ..setTextController(
        _searchQueryController,
        widget.minimumChars,
      );
  }

  @override
  void onListChanged(List<T?> items) {
    setState(() {
      _loading = false;
      _list = items;
    });
  }

  @override
  void onLoading() {
    setState(() {
      _loading = true;
      _error = null;
      animate = true;
    });
  }

  @override
  void onClear() {
    _cancel();
  }

  @override
  void onError(Error error) {
    setState(() {
      _loading = false;
      _error = widget.onError != null ? widget.onError!(error) : const Text('error');
    });
  }

  Future<void> _onTextChanged(String newText) async {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(widget.debounceDuration, () async {
      if (newText.length >= widget.minimumChars) {
        await searchBarController._search(newText, widget.onSearch);
      } else {
        setState(() {
          _list.clear();
          _error = null;
          _loading = false;
          animate = false;
        });
      }
    });
  }

  void _cancel() {
    if (widget.onCancelled != null) {
      widget.onCancelled!.call();
    }

    setState(() {
      _searchQueryController.clear();
      _list.clear();
      _isTitle = !_isTitle;
      _error = null;
      _loading = false;
      animate = false;
    });
  }

  Widget _buildListView(
    List<T?> items,
    Widget Function(T? item, int index) builder,
  ) =>
      GridView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: widget.listPadding,
        itemCount: items.length,
        shrinkWrap: widget.shrinkWrap,
        scrollDirection: widget.scrollDirection,
        itemBuilder: (_, index) => builder(items[index], index),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
      );

  Widget? _buildContent() {
    if (_error != null) {
      return _error;
    } else if (_loading) {
      return widget.loader;
    } else if (_searchQueryController.text.length < widget.minimumChars) {
      if (widget.placeHolder != null) return widget.placeHolder;
      return _buildListView(
        widget.suggestions,
        widget.buildSuggestion ?? widget.onItemFound,
      );
    } else if (_list.isNotEmpty) {
      return _buildListView(_list, widget.onItemFound);
    } else {
      return widget.emptyWidget;
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Material(
            color: context.theme.appBarTheme.backgroundColor,
            shape: context.theme.appBarTheme.shape,
            child: Padding(
              padding: widget.searchBarPadding,
              child: TextField(
                onTap: widget.onFieldTap,
                controller: _searchQueryController,
                onChanged: _onTextChanged,
                style: widget.textStyle,
                focusNode: widget.focusNode,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: widget.icon,
                  ),
                  fillColor: context.color.disabledCard,
                  filled: true,
                  suffixIcon: Visibility(
                    visible: _searchQueryController.text.length >= widget.minimumChars,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        maxWidth: 36,
                        maxHeight: 36,
                      ),
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      ),
                      iconSize: 18,
                      icon: Icon(
                        Icons.close,
                        color: context.theme.colorScheme.onSurface,
                      ),
                      onPressed: () {
                        _onTextChanged('');
                        _searchQueryController.clear();
                      },
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(
                    right: 12,
                    bottom: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle,
                ),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          ),
          Padding(
            padding: widget.headerPadding,
            child: widget.header ?? const SizedBox(),
          ),
          Expanded(
            child: _buildContent() ?? const SizedBox(),
          ),
        ],
      );
}
