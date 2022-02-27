import 'package:astro/core/error/failure.dart';

class LayerResponse<T> {
  T? data;
  Failure? failure;

  LayerResponse({this.data, this.failure});
}
