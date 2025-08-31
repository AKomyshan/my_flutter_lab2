import 'package:flutter_lab/features/homeworks/lesson_23_error_handling_homework/data/repository/entity/user_entity.dart';

sealed class UserProfileState {}

final class UserProfileLoading implements UserProfileState {}

final class UserProfileLoaded implements UserProfileState {
  UserProfileLoaded(this.user);

  final UserEntity user;
}

final class UserProfileLoadingError implements UserProfileState {
  UserProfileLoadingError(this.message);

  final String message;
}
