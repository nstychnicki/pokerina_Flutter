// authentication_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStarted) {
      // TODO
    } else if (event is AuthenticationLoggedIn) {
      yield AuthenticationSuccess();
    } else if (event is AuthenticationLoggedOut) {
      yield AuthenticationFailure();
    }
  }
}
