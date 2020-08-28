import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/images_screen_bloc/bloc.dart';
import '../models/colors.dart';
import '../models/image.dart';
import '../repositories/images_repository_interface.dart';
import '../screens/image_screen.dart';
import '../widgets/images_list.dart';

class ImagesPage extends StatefulWidget {
  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  ImagesScreenBloc bloc;

  final scrollController = ScrollController();

  bool isLoadingNextPage = false;

  @override
  void initState() {
    super.initState();

    final repository =
        RepositoryProvider.of<ImagesRepositoryInterface>(context);

    bloc = ImagesScreenBloc(repository: repository)..add(ImagesFetch());

    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  void _scrollListener() {
    if (!isLoadingNextPage) {
      final fetchOffset = scrollController.position.maxScrollExtent -
          MediaQuery.of(context).size.height;
      if (scrollController.offset > fetchOffset) {
        isLoadingNextPage = true;
        bloc.add(ImagesFetchNextPage());
      }
    }
  }

  _onImageTap(ImageModel image) {
    Navigator.of(context).pushNamed(ImageScreen.routeName,
        arguments: ImageScreenArguments(image));
  }

  _onColorSelected(AcceptedColor color) {
    bloc.add(ImagesFetch(color: color));
  }

  Widget _buildImageListView(ImagesScreenFetched state) {
    return ImagesListView(
      controller: scrollController,
      images: state.images,
      onTap: _onImageTap,
    );
  }

  List<DropdownMenuItem<AcceptedColor>> _buildDropDownItems() {
    return AcceptedColor.values
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString().split('.').last),
            value: e,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ImagesScreenBloc, ImagesScreenState>(
        cubit: bloc,
        builder: (context, state) {
          Widget body;
          AcceptedColor selectedColor;
          if (state is ImagesScreenInitial) {
            body = Container();
          }
          if (state is ImagesScreenFetched) {
            isLoadingNextPage = state.isLoading;
            body = _buildImageListView(state);
            selectedColor = state.color;
          }
          if (state is ImagesScreenLoading) {
            body = Center(
              child: CircularProgressIndicator(),
            );
            selectedColor = state.color;
          }

          if (state is ImagesScreenError) {
            body = Center(
              child: Text("Error"),
            );
          }

          return Scaffold(
              appBar: AppBar(
                title: DropdownButton(
                  items: _buildDropDownItems(),
                  onChanged: _onColorSelected,
                  value: selectedColor,
                ),
              ),
              body: body);
        },
      );
}
