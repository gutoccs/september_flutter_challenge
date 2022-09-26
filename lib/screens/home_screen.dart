import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:september_flutter_challenge/bloc/gif/gif_cubit.dart';

import 'package:september_flutter_challenge/models/gif.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _CreateBody(),
    );
  }
}

class _CreateBody extends StatelessWidget {
  const _CreateBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GifCubit, GifState>(
      builder: (BuildContext context, state) {
        if (state is InitialGif) {
          context.read<GifCubit>().uploadTrendingGif();
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UploadedGif) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: StaggeredList(gifList: state.gifList),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class StaggeredList extends StatelessWidget {
  final List<Gif>? gifList;

  StaggeredList({this.gifList});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MasonryGridView.builder(
      itemCount: gifList?.length,
      scrollDirection: Axis.vertical,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemBuilder: (context, index) {
        //32 = 12px de ambos lado más 8px de separación
        double widthTile = (size.width - 32) / 2;
        double imageDecrement =
            widthTile / gifList![index].images.downsized.width.toDouble();
        double heightTile =
            gifList![index].images.downsized.height.toDouble() * imageDecrement;

        final randomNumberGenerator = Random();

        return GifCard(
          gif: gifList![index],
          height: heightTile,
          isCheck: randomNumberGenerator
              .nextBool(), // Emulando si el usuario ya tenía marcado o no como favorito
        );
      },
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}

class GifCard extends StatefulWidget {
  GifCard({required this.gif, required this.height, required this.isCheck});

  final Gif gif;
  final double height;
  late bool isCheck;

  @override
  State<GifCard> createState() => _GifCardState();
}

class _GifCardState extends State<GifCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      alignment: Alignment.center,
      height: widget.height,
      child: Stack(
        children: [
          Image.network(
            widget.gif.images.downsized.url,
            fit: BoxFit.cover,
          ),

          // Botón de Favorito
          GestureDetector(
            onTap: () {
              setState(() {
                widget.isCheck = !widget.isCheck;
              });
            },
            child: Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.only(right: 8, bottom: 8),
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: (widget.isCheck) ? Colors.red : Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  (widget.isCheck) ? Icons.favorite : Icons.favorite_outline,
                  color: (widget.isCheck) ? Colors.white : Colors.red,
                  size: (widget.isCheck) ? 18 : 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
