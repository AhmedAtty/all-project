class Times{
  String Sunrise;
  String Fajr;
  String Dhuhr;
  String Asr;
  String Maghrib;
  String Isha;


  Times({required this.Sunrise,required this.Fajr,required this.Dhuhr,required this.Asr,required this.Maghrib,required this.Isha});

  factory Times.fromMap(Map<String, dynamic> Map) {
    return Times(
      Sunrise: Map["Sunrise"],
      Fajr: Map["Fajr"],
      Dhuhr: Map["Dhuhr"],
      Asr: Map["Asr"],
      Maghrib: Map["Maghrib"],
      Isha: Map["Isha"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "Sunrise": this.Sunrise,
      "Fajr": this.Fajr,
      "Dhuhr": this.Dhuhr,
      "Asr": this.Asr,
      "Maghrib": this.Maghrib,
      "Isha": this.Isha,
    };
  }
//



}
