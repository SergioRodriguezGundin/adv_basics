class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList
        .shuffle(); // dont create a new memory space, use it the answers memory block
    return shuffledList;
  }
}
