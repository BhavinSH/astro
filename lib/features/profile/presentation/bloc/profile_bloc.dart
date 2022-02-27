import 'package:astro/features/profile/data/models/relative_data.dart';
import 'package:astro/features/profile/domain/repositories/profile_repository.dart';
import 'package:bloc/bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc(this._profileRepository) : super(ProfileState()) {
    on<GetRelativesEvent>((event, emit) async {
      emit(ProfileLoadingState());
      var response = await _profileRepository.getAllRelatives();
      if (response.data != null) {
        emit(AllRelativeState(data: response.data));
      } else {}
    });
  }
}
