import 'package:bloc/bloc.dart';
import 'package:sanad/services/apiService.dart';

class AuthCubit extends Cubit<bool> {
  final ApiService apiService;

  AuthCubit(this.apiService) : super(false) {
    checkSignInStatus();
  }
  bool singing =
      false; //if the user push the sign in button multiple times , the request will be sent once
  Future<void> signIn(String username, String password) async {
    if (singing) return;
    singing = true;
    final response = await apiService.signIn(username, password);
    if (response.statusCode == 200) {
      emit(true);
    } else {
      emit(false);
    }
    singing = false;
  }

  Future<void> checkSignInStatus() async {
    final token = await apiService.getToken();
    emit(token != null);
  }

  Future<void> signOut() async {
    await apiService.deleteToken();
    emit(false);
  }
}
