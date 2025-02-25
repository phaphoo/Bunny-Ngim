import 'dart:convert';

class ConfigModel {
  String backend;
  JsEnv jsEnv;
  Map<String, List<String>> bankendLang;
  Map<String, List<String>> projectLang;
  List<List<String>> multilang;
  ProtectMe protectMe;
  int rpp;
  String uploadable;
  String allowtags;
  Map<String, String> permission;
  Map<String, String> discounttype;
  Map<String, String> currencyFormat;
  List<ContactUs> contactus;
  List<Report> bsRpt;
  List<Report> plRpt;
  List<Report> cfRpt;

  ConfigModel({
    required this.backend,
    required this.jsEnv,
    required this.bankendLang,
    required this.projectLang,
    required this.multilang,
    required this.protectMe,
    required this.rpp,
    required this.uploadable,
    required this.allowtags,
    required this.permission,
    required this.discounttype,
    required this.currencyFormat,
    required this.contactus,
    required this.bsRpt,
    required this.plRpt,
    required this.cfRpt,
  });

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
    backend: json["backend"],
    jsEnv: JsEnv.fromJson(json["js_env"]),
    bankendLang: Map.from(
      json["bankend_lang"],
    ).map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v))),
    projectLang: Map.from(
      json["project_lang"],
    ).map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v))),
    multilang: List<List<String>>.from(
      json["multilang"].map((x) => List<String>.from(x)),
    ),
    protectMe: ProtectMe.fromJson(json["protectme"]),
    rpp: json["rpp"],
    uploadable: json["uploadable"],
    allowtags: json["allowtags"],
    permission: Map<String, String>.from(json["permission"]),
    discounttype: Map<String, String>.from(
      json["discounttype"].map((k, v) => MapEntry(k.toString(), v)),
    ),
    currencyFormat: Map<String, String>.from(
      json["currency_format"].map((k, v) => MapEntry(k.toString(), v)),
    ),
    contactus: List<ContactUs>.from(
      json["contactus"].map((x) => ContactUs.fromJson(x)),
    ),
    bsRpt: List<Report>.from(json["bs_rpt"].map((x) => Report.fromJson(x))),
    plRpt: List<Report>.from(json["pl_rpt"].map((x) => Report.fromJson(x))),
    cfRpt: List<Report>.from(json["cf_rpt"].map((x) => Report.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "backend": backend,
    "js_env": jsEnv.toJson(),
    "bankend_lang": bankendLang,
    "project_lang": projectLang,
    "multilang": multilang,
    "protectme": protectMe.toJson(),
    "rpp": rpp,
    "uploadable": uploadable,
    "allowtags": allowtags,
    "permission": permission,
    "discounttype": discounttype,
    "currency_format": currencyFormat,
    "contactus": List<dynamic>.from(contactus.map((x) => x.toJson())),
    "bs_rpt": List<dynamic>.from(bsRpt.map((x) => x.toJson())),
    "pl_rpt": List<dynamic>.from(plRpt.map((x) => x.toJson())),
    "cf_rpt": List<dynamic>.from(cfRpt.map((x) => x.toJson())),
  };
}

class JsEnv {
  String token;

  JsEnv({required this.token});

  factory JsEnv.fromJson(Map<String, dynamic> json) =>
      JsEnv(token: json["token"]);

  Map<String, dynamic> toJson() => {"token": token};
}

class ProtectMe {
  ProtectItem index;
  ProtectItem show;
  ProtectItem create;
  ProtectItem edit;
  ProtectItem delete;
  ProtectItem destroy;
  ProtectItem restore;

  ProtectMe({
    required this.index,
    required this.show,
    required this.create,
    required this.edit,
    required this.delete,
    required this.destroy,
    required this.restore,
  });

  factory ProtectMe.fromJson(Map<String, dynamic> json) => ProtectMe(
    index: ProtectItem.fromJson(json["index"]),
    show: ProtectItem.fromJson(json["show"]),
    create: ProtectItem.fromJson(json["create"]),
    edit: ProtectItem.fromJson(json["edit"]),
    delete: ProtectItem.fromJson(json["delete"]),
    destroy: ProtectItem.fromJson(json["destroy"]),
    restore: ProtectItem.fromJson(json["restore"]),
  );

  Map<String, dynamic> toJson() => {
    "index": index.toJson(),
    "show": show.toJson(),
    "create": create.toJson(),
    "edit": edit.toJson(),
    "delete": delete.toJson(),
    "destroy": destroy.toJson(),
    "restore": restore.toJson(),
  };
}

class ProtectItem {
  List<String> cover;
  String title;

  ProtectItem({required this.cover, required this.title});

  factory ProtectItem.fromJson(Map<String, dynamic> json) => ProtectItem(
    cover: List<String>.from(json["cover"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {"cover": cover, "title": title};
}

class ContactUs {
  String icon;
  String title;
  String info;

  ContactUs({required this.icon, required this.title, required this.info});

  factory ContactUs.fromJson(Map<String, dynamic> json) =>
      ContactUs(icon: json["icon"], title: json["title"], info: json["info"]);

  Map<String, dynamic> toJson() => {"icon": icon, "title": title, "info": info};
}

class Report {
  int id;
  String title;
  int order;

  Report({required this.id, required this.title, required this.order});

  factory Report.fromJson(Map<String, dynamic> json) =>
      Report(id: json["id"], title: json["title"], order: json["order"]);

  Map<String, dynamic> toJson() => {"id": id, "title": title, "order": order};
}

// Example usage:
// final config = ConfigModel.fromJson(jsonDecode(jsonString));
// print(jsonEncode(config.toJson()));
