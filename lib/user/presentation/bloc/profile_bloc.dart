import 'package:bloc/bloc.dart';
import 'package:lesson_flutter_1/user/presentation/bloc/profile_event.dart';
import 'package:lesson_flutter_1/user/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileStateInitial()) {
    on<ProfileEventLoading>((event, emit) {
      emit(ProfileStateLoading());
    });
    on<ProfileEventAuth>((event, emit) {
      if (event.username == "test1" && event.password == "123456") {
        emit(ProfileStateAuth(event.username));
      }
    });
  }
}
