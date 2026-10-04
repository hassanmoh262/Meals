import 'package:dart_either/dart_either.dart';
import 'package:equatable/equatable.dart';
import 'package:meals/core/error/failure.dart';

abstract class BaseUsecase<T, Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);

}
 class NoParameter  extends Equatable{
  const NoParameter();
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
 }