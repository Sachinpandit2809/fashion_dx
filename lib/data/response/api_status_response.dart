import 'package:fashion_dx/data/response/status.dart';

class ApiStatusResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiStatusResponse(this.status, this.data, this.message);
  ApiStatusResponse.loading() : status = Status.LOADING;
  ApiStatusResponse.completed() : status = Status.COMPLETED;
  ApiStatusResponse.error() : status = Status.ERROR;

 @override
  String toString() {
    return 'Status \n $status Message \n $message Data \n $data';
  }
}
