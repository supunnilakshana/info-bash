class BatterScore{
  final String BatterName;
  final String R;
  final String B;
  final String fours;
  final String sixes;

  const BatterScore({required this.BatterName, required this.R, required this.B, required this.fours, required this.sixes,

});
  BatterScore copy({
    String? BatterName,
     String? R,
     String? B,
     String? fours,
     String? sixes,
})=> BatterScore(BatterName: BatterName ?? this.BatterName,
      R: R ?? this.R,
      B: B ?? this.B,
      fours: fours ?? this.fours,
      sixes: sixes ?? this.sixes);

}

//TODO build score ui