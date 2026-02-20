enum ApiStatus { initial, loading, success, error }

class AppResource<T> {
  T? data = null;
  late bool isLoading = false;
  late String? errorMessage;
  late ApiStatus status;
  AppResource({
    required this.isLoading,
    required this.data,
    required this.errorMessage,
    required this.status,
  });
  AppResource.initial() {
    status = ApiStatus.initial;
  }
  AppResource.loading() {
    isLoading = true;
    status = ApiStatus.loading;
  }
  AppResource.success(T? data) {
    this.data = data;
    status = ApiStatus.success;
  }
  AppResource.error(String error) {
    this.errorMessage = error;
    status = ApiStatus.error;
  }
}
