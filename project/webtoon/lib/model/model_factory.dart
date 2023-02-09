typedef JsonMap = Map<dynamic, dynamic>;

enum Status {
  unfilled,
  filled,
}

class ModelSetter {
  set(JsonMap jsonMap) {}
}

const String nullish = "NULLISH";

/// ### Step1 Define model class
///
/// implements `ModelSetter`
/// `get` method is logic of saving data
/// ```dart
/// class ExampleModel implements ModelSetter {
///   int id = 0;
///
///   @override
///   get(json){
///     id = json["id"];
///   }
/// }
/// ```
/// ---
/// ### Step2 Define model instance
///
/// ```dart
/// final dataList = GetModel(ExampleModel());
/// ```
/// ---
/// ### Step3 Transform to models
///
/// Get `json` list
///   ```dart
///   final exampleJsonList = await fetch("...FetchURL");
///   ```
/// Transform `json` list to your `Model`
///   ```dart
///   dataList.transform(exampleJsonList);
///   ```
/// ---
/// ### Step4 Access data
///
/// Access transformed model with `data` property
/// ```dart
/// print(dataList.data[0].id);
/// // 2
/// ```
class ModelFactory<ModelType extends ModelSetter> {
  Status status = Status.unfilled;
  final ModelType model;
  final List<ModelType> data = [];

  ModelFactory(this.model);

  _updateStatus() {
    if (data.isNotEmpty) {
      status = Status.filled;
    } else {
      status = Status.unfilled;
    }
  }

  _updateData(List<ModelType> modelList) {
    if (modelList.isEmpty == false) data.addAll(modelList);
  }

  /// transform `List<Json>` to `List<Model>`
  void transform(List<dynamic>? jsonList) {
    if (jsonList != null) {
      final List<ModelType> modelList = jsonList.map(
        (json) {
          final modelKeys = (json as JsonMap).keys.toList();

          final jsonMap = modelKeys.fold({}, (previousValue, key) {
            if (json[key] != null) {
              previousValue[key] = json[key];
              return previousValue;
            }
            previousValue[key] = nullish;
            return previousValue;
          });

          model.set(jsonMap);
          return model;
        },
      ).toList();

      _updateData(modelList);
    }

    _updateStatus();
  }
}
