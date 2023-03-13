part of 'blog_bloc.dart';

abstract class BlogState extends Equatable {}

class BlogInitial extends BlogState {
    @override
  List<Object> get props => [];
}

class BlogLoadingState extends BlogState {
  @override
  List<Object> get props => [];
}
