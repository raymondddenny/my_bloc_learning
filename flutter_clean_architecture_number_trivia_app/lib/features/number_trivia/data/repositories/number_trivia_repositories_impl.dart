import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/repositories/number_trivia_repositories.dart';
import '../datasources/number_trivia_local_datasources.dart';
import '../datasources/number_trivia_remote_datasources.dart';

class NumberTriviaRepositoryImpl extends NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviLocalDataSource localDataSource;
  final NetWorkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });
  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) {
    networkInfo.isConnected;
    return null;
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }
}
