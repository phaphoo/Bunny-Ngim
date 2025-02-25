class MainMenu {
  int? id;
  String? ref;
  int? refId;
  String? target;
  Titles? titles;
  String? seoindex;
  String? linkPath;

  MainMenu({
    this.id,
    this.ref,
    this.refId,
    this.target,
    this.titles,
    this.seoindex,
    this.linkPath,
  });

  MainMenu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ref = json['ref'];
    refId = json['ref_id'];
    target = json['target'];
    titles =
        json['titles'] != null ? new Titles.fromJson(json['titles']) : null;
    seoindex = json['seoindex'];
    linkPath = json['link_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['ref'] = ref;
    data['ref_id'] = refId;
    data['target'] = target;
    if (titles != null) {
      data['titles'] = titles!.toJson();
    }
    data['seoindex'] = seoindex;
    data['link_path'] = linkPath;
    return data;
  }
}

class Titles {
  String? en;
  String? km;

  Titles({this.en, this.km});

  Titles.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    km = json['km'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = en;
    data['km'] = km;
    return data;
  }
}
