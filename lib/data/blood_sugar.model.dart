class Blood {
  late int bloodSugar;
  late String measureState;
  late DateTime measureTime;

  Blood(this.bloodSugar, this.measureState, this.measureTime);

  Blood.fromJson(Map<String, dynamic> json) {
    bloodSugar = json['blood_sugar'];
    measureState = json['measure_state'];
    measureTime = DateTime.parse(json['measure_time']);
  }
}