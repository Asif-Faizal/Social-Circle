import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(UserDetailsInitial()) {
    on<UserDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
