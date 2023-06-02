import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String statusMessage;

  const ErrorMessageModel({
    required this.statusMessage,
  });

  factory ErrorMessageModel.fromServer(String message) {
    return ErrorMessageModel(
      statusMessage: message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    statusMessage,
  ];
}
