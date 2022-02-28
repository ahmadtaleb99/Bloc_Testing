  class BrightnessState {
  bool isDark;

  BrightnessState({required this.isDark});

    factory BrightnessState.fromJson(dynamic json) =>
      BrightnessState(isDark: json['isDark']);

  Map<String, dynamic> toJson() => {'isDark':  this.isDark};

  @override
  String toString() {
    return 'BrightnessState{isDark: $isDark}';
  }
}
