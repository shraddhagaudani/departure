class Shlok_Model {
  int? shlokno;
  String? sanskrut;
  String? gujrati;
  String? english;

  Shlok_Model({
    required this.shlokno,
    required this.sanskrut,
    required this.gujrati,
    required this.english,
  });

  factory Shlok_Model.fromMap({required Map data}) {
    return Shlok_Model(
        shlokno: data['shlok'],
        sanskrut: data['sanskrut'],
        gujrati: data['gujrati'],
        english: data['english']);
  }
}

class PopUpMenuButton_Model {
  String? initialval;

  PopUpMenuButton_Model({required this.initialval});
}

class ThemeAccess_Model {
  bool isdark;

  ThemeAccess_Model({
    required this.isdark,
  });
}
