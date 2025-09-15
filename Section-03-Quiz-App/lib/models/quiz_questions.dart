class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers; 
  List<String> shuffledList() {
    final shuffled= List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}