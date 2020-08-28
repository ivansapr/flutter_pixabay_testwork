import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../repositories/images_repository_interface.dart';
import 'package:meta/meta.dart';

import 'images_screen_event.dart';
import 'images_screen_state.dart';

class ImagesScreenBloc extends Bloc<ImagesScreenEvent, ImagesScreenState> {
  ImagesScreenBloc({@required this.repository}) : super(ImagesScreenInitial());

  final ImagesRepositoryInterface repository;

  Stream<ImagesScreenState> fetchImages(ImagesFetch event) async* {
    yield ImagesScreenLoading(color: event.color);
    try {
      final pagination = await repository.search(color: event.color);
      yield ImagesScreenFetched(
        color: event.color,
        images: pagination.hits,
        page: 1,
        hasReachedMax: false,
      );
    } catch (e) {
      print(e);
      yield ImagesScreenError();
    }
  }

  Stream<ImagesScreenState> fetchNextPageImages(
      ImagesFetchNextPage event) async* {
    final currentState = state;

    if (currentState is ImagesScreenFetched) {
      yield currentState.copyWith(isLoading: true);
      try {
        final pagination = await repository.search(
          color: currentState.color,
          page: currentState.page + 1,
        );

        yield currentState.copyWith(
          images: currentState.images + pagination.hits,
          page: currentState.page + 1,
          hasReachedMax: false,
          isLoading: false,
        );
      } catch (e) {
        yield currentState.copyWith(
          hasReachedMax: true,
          isLoading: true,
        );
      }
    }
  }

  @override
  Stream<ImagesScreenState> mapEventToState(ImagesScreenEvent event) async* {
    if (event is ImagesFetch) {
      yield* fetchImages(event);
    }
    if (event is ImagesFetchNextPage) {
      yield* fetchNextPageImages(event);
    }
  }
}
