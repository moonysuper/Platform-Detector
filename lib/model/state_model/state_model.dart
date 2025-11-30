import 'package:get/get.dart';

enum RequestState {loading, success, failure, empty ,none}

class CustomState {
  var state = RequestState.loading.obs;
  var data = ''.obs; // You can replace this with your data model type

  void changeState(RequestState newState, {String? data}) {
    state.value = newState;
    if (data != null) {
      this.data.value = data;
    }
  }
}
