class ApiResponseModel {
  late bool success;
  dynamic data;

  ApiResponseModel({
    required this.success,
    this.data
  });

  ApiResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'];
  }
}