part of 'profile_bloc.dart';

class ProfileState {}

class ProfileLoadingState extends ProfileState {}

class AllRelativeState extends ProfileState {
  List<RelativeData>? data = List.empty(growable: true);

  AllRelativeState({
    required this.data,
  });
}
