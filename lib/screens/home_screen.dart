import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:september_flutter_challenge/bloc/gif/gif_cubit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:september_flutter_challenge/models/gif.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CreateAppBar(),
      body: _CreateBody(),
    );
  }
}

class _CreateAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    String auxText = '';
    return SafeArea(
      minimum: const EdgeInsets.only(top: 30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          height: preferredSize.height,
          width: preferredSize.width - 12.0,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(225, 228, 234, 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
            elevation: 0,
            title: TextField(
              onSubmitted: (String text) {
                searchGif(auxText, context);
              },
              onChanged: (String text) {
                auxText = text;
              },
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Search by name',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(151, 158, 169, 1),
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                color: Color.fromRGBO(151, 158, 169, 1),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                searchGif(auxText, context);
              },
              icon: const Icon(
                Icons.search,
                color: Color.fromRGBO(28, 33, 35, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void searchGif(String auxText, BuildContext context) {
    if (auxText == '')
      context.read<GifCubit>().uploadTrendingGif();
    else
      context.read<GifCubit>().uploadSearchGif(auxText);
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

    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: MasonryGridView.builder(
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
              gifList![index].images.downsized.height.toDouble() *
                  imageDecrement;

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
