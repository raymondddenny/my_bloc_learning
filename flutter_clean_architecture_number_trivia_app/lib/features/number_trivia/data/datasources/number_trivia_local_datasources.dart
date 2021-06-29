import 'package:flutter_clean_architecture_number_trivia_app/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}