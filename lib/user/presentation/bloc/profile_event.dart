abstract class ProfileEvent {}

class ProfileEventLoading implements ProfileEvent {}

class ProfileEventAuth implements ProfileEvent {
  String username;
  String password;
  ProfileEventAuth(this.username, this.password);
}
