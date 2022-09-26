// aquí las peticiones http

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:september_flutter_challenge/models/gif.dart';

import 'package:september_flutter_challenge/providers/gif_provider.dart';

part 'gif_state.dart';

class GifCubit extends Cubit<GifState> {
  GifCubit() : super(InitialGif());

  void uploadTrendingGif() async {
    GifProvider gifProvider = GifProvider();

    final apiResponse = await gifProvider.trendingGif();

    emit(UploadedGif(gifList: apiResponse.gif));
  }
}
