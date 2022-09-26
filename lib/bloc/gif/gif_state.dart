part of 'gif_cubit.dart';

@immutable
abstract class GifState {}

class InitialGif extends GifState {
  final List<Gif> generalList = [];
}

class UploadedGif extends GifState {
  final List<Gif>? gifList;

  UploadedGif({required this.gifList});
}
