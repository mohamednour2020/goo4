part of 'popular_cubit.dart';

@immutable
sealed class PopularState {}

final class PopularInitial extends PopularState {}
final class PopularLoading extends PopularState {}
final class PopularSuccess extends PopularState {}
final class PopularError extends PopularState {}
