class FibonacciItem {
final int number;
final String type;
bool isHighlighted;

FibonacciItem({
  required this.number,
  required this.type,
  this.isHighlighted = false,
});

FibonacciItem copyWith({
  int? number,
  String? type,
  int? index,
  bool? isHighlighted,
}) {
  return FibonacciItem(
    number: number ?? this.number,
    type: type ?? this.type,
    isHighlighted: isHighlighted ?? this.isHighlighted,
  );
}
}