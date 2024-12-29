
import '../constant/exception_constants.dart';
import 'server_exception.dart';

class ServerErrorException extends Failure {
  ServerErrorException(String message)
      : super(
          message: message,
          code: ExceptionConstants.internalServerError,
        );
}
