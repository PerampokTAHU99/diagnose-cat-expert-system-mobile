class Symptom {
  int? idSymptom;
  String? codeOfSymptom;
  String? descOfSymptom;

  Symptom({this.idSymptom, this.codeOfSymptom, this.descOfSymptom});

  Symptom.fromJson(Map<String, dynamic> json) {
    idSymptom = int.parse(json['idSymptom']);
    codeOfSymptom = json['codeOfSymptom'];
    descOfSymptom = json['descOfSymptom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idSymptom'] = idSymptom;
    data['codeOfSymptom'] = codeOfSymptom;
    data['descOfSymptom'] = descOfSymptom;
    return data;
  }
}
