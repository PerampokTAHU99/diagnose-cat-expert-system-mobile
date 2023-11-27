class Disease {
  String? idDisease;
  String? codeOfDisease;
  String? nameOfDisease;
  String? latinNameOfDisease;
  String? picture;
  String? description;
  String? precaution;
  String? solution;

  Disease({
    this.idDisease,
    this.codeOfDisease,
    this.nameOfDisease,
    this.latinNameOfDisease,
    this.picture,
    this.description,
    this.precaution,
    this.solution
  });

  Disease.fromJson(Map<String, dynamic> json) {
    idDisease = json['idDisease'];
    codeOfDisease = json['codeOfDisease'];
    nameOfDisease = json['nameOfDisease'];
    latinNameOfDisease = json['latinNameOfDisease'];
    picture = json['picture'];
    description = json['description'];
    precaution = json['precaution'];
    solution = json['solution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['idDisease'] = idDisease;
    data['codeOfDisease'] = codeOfDisease;
    data['nameOfDisease'] = nameOfDisease;
    data['latinNameOfDisease'] = latinNameOfDisease;
    data['picture'] = picture;
    data['description'] = description;
    data['precaution'] = precaution;
    data['solution'] = solution;

    return data;
  }
}
