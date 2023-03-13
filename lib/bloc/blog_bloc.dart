import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogLoadingState()) {
    on<BlogEvent>((event, emit) {
      emit(BlogLoadingState());
    });
  }
}
