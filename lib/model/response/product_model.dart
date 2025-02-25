class ProductModel {
  Productsource? productsource;
  Productrecordinfo? productrecordinfo;

  ProductModel({this.productsource, this.productrecordinfo});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productsource =
        json['productsource'] != null
            ? new Productsource.fromJson(json['productsource'])
            : null;
    productrecordinfo =
        json['productrecordinfo'] != null
            ? new Productrecordinfo.fromJson(json['productrecordinfo'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productsource != null) {
      data['productsource'] = this.productsource!.toJson();
    }
    if (this.productrecordinfo != null) {
      data['productrecordinfo'] = this.productrecordinfo!.toJson();
    }
    return data;
  }
}

class Productsource {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Productsource({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  Productsource.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  int? categoryId;
  String? barcode;
  String? productcode;
  String? sizes;
  String? colors;
  String? units;
  int? unitId;
  String? printerId;
  String? costing;
  String? pricing;
  String? xtraprice;
  String? discount;
  int? pvat;
  String? madewith;
  String? productType;
  String? isservice;
  String? imginfo;
  String? display;
  String? title;
  String? category;
  String? unit;
  String? expireddate;
  String? dfpricing;
  String? priceformat;

  Data({
    this.id,
    this.categoryId,
    this.barcode,
    this.productcode,
    this.sizes,
    this.colors,
    this.units,
    this.unitId,
    this.printerId,
    this.costing,
    this.pricing,
    this.xtraprice,
    this.discount,
    this.pvat,
    this.madewith,
    this.productType,
    this.isservice,
    this.imginfo,
    this.display,
    this.title,
    this.category,
    this.unit,
    this.expireddate,
    this.dfpricing,
    this.priceformat,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    barcode = json['barcode'];
    productcode = json['productcode'];
    sizes = json['sizes'];
    colors = json['colors'];
    units = json['units'];
    unitId = json['unit_id'];
    printerId = json['printer_id'];
    costing = json['costing'];
    pricing = json['pricing'];
    xtraprice = json['xtraprice'];
    discount = json['discount'];
    pvat = json['pvat'];
    madewith = json['madewith'];
    productType = json['product_type'];
    isservice = json['isservice'];
    imginfo = json['imginfo'];
    display = json['display'];
    title = json['title'];
    category = json['category'];
    unit = json['unit'];
    expireddate = json['expireddate'];
    dfpricing = json['dfpricing'];
    priceformat = json['priceformat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['barcode'] = this.barcode;
    data['productcode'] = this.productcode;
    data['sizes'] = this.sizes;
    data['colors'] = this.colors;
    data['units'] = this.units;
    data['unit_id'] = this.unitId;
    data['printer_id'] = this.printerId;
    data['costing'] = this.costing;
    data['pricing'] = this.pricing;
    data['xtraprice'] = this.xtraprice;
    data['discount'] = this.discount;
    data['pvat'] = this.pvat;
    data['madewith'] = this.madewith;
    data['product_type'] = this.productType;
    data['isservice'] = this.isservice;
    data['imginfo'] = this.imginfo;
    data['display'] = this.display;
    data['title'] = this.title;
    data['category'] = this.category;
    data['unit'] = this.unit;
    data['expireddate'] = this.expireddate;
    data['dfpricing'] = this.dfpricing;
    data['priceformat'] = this.priceformat;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}

class Productrecordinfo {
  int? from;
  int? to;
  int? total;
  int? perpage;
  int? lastpage;

  Productrecordinfo({
    this.from,
    this.to,
    this.total,
    this.perpage,
    this.lastpage,
  });

  Productrecordinfo.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    total = json['total'];
    perpage = json['perpage'];
    lastpage = json['lastpage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['total'] = this.total;
    data['perpage'] = this.perpage;
    data['lastpage'] = this.lastpage;
    return data;
  }
}
