import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/features/homeworks/lesson_23_error_handling_homework/data/repository/fake_user_repository.dart';
import 'package:flutter_lab/features/homeworks/lesson_23_error_handling_homework/exceptions/custom_server_exception.dart';
import 'package:flutter_lab/features/homeworks/lesson_23_error_handling_homework/presentation/cubit/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this.repository) : super(UserProfileLoading());

  final FakeUserRepository repository;

  Future<void> loadUserProfile() async {
    emit(UserProfileLoading());

    try {
      final user = await repository.getUserProfile();
      emit(UserProfileLoaded(user));
    } on CustomServerException catch (cse) {
      emit(UserProfileLoadingError(cse.message));
    } catch (e) {
      emit(UserProfileLoadingError(e.toString()));
    }
  }
}
