class ValidateState {
  final String text;
  bool isTrue;

  ValidateState({this.isTrue = true, this.text = 'test'});

  ValidateState copyWith({
    String? text,
    bool? isTrue
  }) =>
      ValidateState(
        text: text ?? this.text,
        isTrue: isTrue ?? this.isTrue
      );
}
