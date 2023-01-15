class BallerScore{
  final String BallerName;
  final String O;
  final String M;
  final String R;

  const BallerScore({required this.BallerName, required this.O, required this.M, required this.R,
  });
  BallerScore copy({
    String? BallerName,
    String? O,
    String? M,
    String? R,
  })=> BallerScore(
    BallerName: BallerName ?? this.BallerName,
      O: O ?? this.O,
      M: M ?? this.M,
      R: R ?? this.R,);

}
//TODO build score ui