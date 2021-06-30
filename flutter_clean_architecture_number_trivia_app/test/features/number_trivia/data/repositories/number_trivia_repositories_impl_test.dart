import 'package:flutter_clean_architecture_number_trivia_app/core/platform/network_info.dart';
import 'package:flutter_clean_architecture_number_trivia_app/features/number_trivia/data/datasources/number_trivia_local_datasources.dart';
import 'package:flutter_clean_architecture_number_trivia_app/features/number_trivia/data/datasources/number_trivia_remote_datasources.dart';
import 'package:flutter_clean_architecture_number_trivia_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:flutter_clean_architecture_number_trivia_app/features/number_trivia/data/repositories/number_trivia_repositories_impl.dart';
import 'package:flutter_clean_architecture_number_trivia_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviLocalDataSource {}

class MockNetworkInfo extends Mock implements NetWorkInfo {}

void main() {
  NumberTriviaRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group("getConcreteNumberTrivia", () {
    final testNumber = 1;
    final testNumberTriviaModel =
        NumberTriviaModel(text: "Test text", number: testNumber);
    final NumberTrivia testNumberTrivia = testNumberTriviaModel;
    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

        // act
        repository.getConcreteNumberTrivia(testNumber);

        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );
  });
}
