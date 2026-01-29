import '../../../shared/api/client/api_client.dart';
import '../models/example_model.dart';

class ExampleRepository {
  final ApiClient _apiClient;

  ExampleRepository(this._apiClient);

  Future<List<ExampleModel>> getAll() async {
    final response = await _apiClient.get('/examples');
    final List<dynamic> data = response.data as List<dynamic>;
    return data.map((json) => ExampleModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<ExampleModel> getById(String id) async {
    final response = await _apiClient.get('/examples/$id');
    return ExampleModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<ExampleModel> create(ExampleModel model) async {
    final response = await _apiClient.post('/examples', data: model.toJson());
    return ExampleModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<ExampleModel> update(String id, ExampleModel model) async {
    final response = await _apiClient.put('/examples/$id', data: model.toJson());
    return ExampleModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> delete(String id) async {
    await _apiClient.delete('/examples/$id');
  }
}
