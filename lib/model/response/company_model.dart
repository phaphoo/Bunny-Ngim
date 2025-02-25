class CompanyProfileModel {
  String? latinname;
  String? nativename;
  String? logo;
  String? icon;
  String? companyid;
  String? vatnumber;
  String? receiveremail;
  String? address;
  String? phone;
  String? otherphone;
  String? saleemail;
  String? supportemail;
  String? website;
  String? map;
  String? facebook;
  String? youtube;
  String? twitter;
  String? linkedin;
  String? line;
  String? telegram;
  String? maildriver;
  String? encryption;
  String? host;
  String? mailport;
  String? mailuser;
  String? mailpassword;
  String? fromemail;
  String? fromname;

  CompanyProfileModel({
    this.latinname,
    this.nativename,
    this.logo,
    this.icon,
    this.companyid,
    this.vatnumber,
    this.receiveremail,
    this.address,
    this.phone,
    this.otherphone,
    this.saleemail,
    this.supportemail,
    this.website,
    this.map,
    this.facebook,
    this.youtube,
    this.twitter,
    this.linkedin,
    this.line,
    this.telegram,
    this.maildriver,
    this.encryption,
    this.host,
    this.mailport,
    this.mailuser,
    this.mailpassword,
    this.fromemail,
    this.fromname,
  });

  CompanyProfileModel.fromJson(Map<String, dynamic> json) {
    latinname = json['latinname'];
    nativename = json['nativename'];
    logo = json['logo'];
    icon = json['icon'];
    companyid = json['companyid'];
    vatnumber = json['vatnumber'];
    receiveremail = json['receiveremail'];
    address = json['address'];
    phone = json['phone'];
    otherphone = json['otherphone'];
    saleemail = json['saleemail'];
    supportemail = json['supportemail'];
    website = json['website'];
    map = json['map'];
    facebook = json['facebook'];
    youtube = json['youtube'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    line = json['line'];
    telegram = json['telegram'];
    maildriver = json['maildriver'];
    encryption = json['encryption'];
    host = json['host'];
    mailport = json['mailport'];
    mailuser = json['mailuser'];
    mailpassword = json['mailpassword'];
    fromemail = json['fromemail'];
    fromname = json['fromname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latinname'] = latinname;
    data['nativename'] = nativename;
    data['logo'] = logo;
    data['icon'] = icon;
    data['companyid'] = companyid;
    data['vatnumber'] = vatnumber;
    data['receiveremail'] = receiveremail;
    data['address'] = address;
    data['phone'] = phone;
    data['otherphone'] = otherphone;
    data['saleemail'] = saleemail;
    data['supportemail'] = supportemail;
    data['website'] = website;
    data['map'] = map;
    data['facebook'] = facebook;
    data['youtube'] = youtube;
    data['twitter'] = twitter;
    data['linkedin'] = linkedin;
    data['line'] = line;
    data['telegram'] = telegram;
    data['maildriver'] = maildriver;
    data['encryption'] = encryption;
    data['host'] = host;
    data['mailport'] = mailport;
    data['mailuser'] = mailuser;
    data['mailpassword'] = mailpassword;
    data['fromemail'] = fromemail;
    data['fromname'] = fromname;
    return data;
  }
}
