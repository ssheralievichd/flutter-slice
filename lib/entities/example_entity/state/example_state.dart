import 'package:flutter/foundation.dart';
import '../api/example_repository.dart';
import '../models/example_model.dart';

class ExampleState extends ChangeNotifier {
  final ExampleRepository _repository;

  ExampleState(this._repository);

  List<ExampleModel> _items = [];
  bool _isLoading = false;
  String? _error;

  List<ExampleModel> get items => _items;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadItems() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _items = await _repository.getAll();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createItem(ExampleModel model) async {
    try {
      final created = await _repository.create(model);
      _items.add(created);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> updateItem(String id, ExampleModel model) async {
    try {
      final updated = await _repository.update(id, model);
      final index = _items.indexWhere((item) => item.id == id);
      if (index != -1) {
        _items[index] = updated;
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      await _repository.delete(id);
      _items.removeWhere((item) => item.id == id);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }
}
