import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String errorMessage;

  ErrorMessageModel({required this.errorMessage});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(errorMessage: json["meals"]);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
