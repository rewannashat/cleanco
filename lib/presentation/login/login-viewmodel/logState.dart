
abstract class LoginStates {}
class InitialState extends LoginStates {}
class ChangeIconButtonState extends LoginStates {}


class GetDataError extends LoginStates {
  final String error ;

  GetDataError(this.error);

}

class ChangeListState extends LoginStates {}



