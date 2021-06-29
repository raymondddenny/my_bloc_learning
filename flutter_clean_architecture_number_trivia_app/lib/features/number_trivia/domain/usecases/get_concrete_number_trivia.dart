import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_number_trivia_app/core/error/failure.dart';
import 'package:flutter_clean_architecture_number_trivia_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:meta/meta.dart';
import '../repositories/number_trivia_repositories.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;
  GetConcreteNumberTrivia(
    this.repository,
  );

  Future<Either<Failure, NumberTrivia>> execute({@required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
