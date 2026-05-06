abstract class ProfileState {}

class ProfileStateAuth extends ProfileState {
  String username;
  ProfileStateAuth(this.username);
}

class ProfileStateInitial extends ProfileState {}

class ProfileStateLoading extends ProfileState {}
