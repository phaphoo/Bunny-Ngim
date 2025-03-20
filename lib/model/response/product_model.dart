import 'dart:convert';

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
    if (productsource != null) {
      data['productsource'] = productsource!.toJson();
    }
    if (productrecordinfo != null) {
      data['productrecordinfo'] = productrecordinfo!.toJson();
    }
    return data;
  }
}

class Productsource {
  int? currentPage;
  List<Product>? data;
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
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
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
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Product {
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
  ImageInfo? imginfo;
  String? display;
  String? title;
  String? category;
  String? unit;
  String? expireddate;
  String? dfpricing;
  String? priceformat;

  Product({
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

  Product.fromJson(Map<String, dynamic> json) {
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
    discount = json['discount'].toString();
    pvat = json['pvat'];
    madewith = json['madewith'];
    productType = json['product_type'];
    isservice = json['isservice'];
    // imginfo = json['imginfo'];
    if (json['imginfo'] != null) {
      if (json['imginfo'] is String) {
        // If `imginfo` is a String, decode it
        List<dynamic> imgList = jsonDecode(json['imginfo']);
        imginfo = imgList.isNotEmpty ? ImageInfo.fromJson(imgList[0]) : null;
      } else if (json['imginfo'] is List) {
        // If `imginfo` is already a List
        imginfo =
            json['imginfo'].isNotEmpty
                ? ImageInfo.fromJson(json['imginfo'][0])
                : null;
      } else if (json['imginfo'] is Map) {
        // If `imginfo` is a single Map
        imginfo = ImageInfo.fromJson(json['imginfo']);
      }
    }
    display = json['display'];
    title = json['title'];
    category = json['category'];
    unit = json['unit'];
    expireddate = json['expireddate'];
    dfpricing = json['dfpricing'].toString();
    priceformat = json['priceformat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['category_id'] = categoryId;
    data['barcode'] = barcode;
    data['productcode'] = productcode;
    data['sizes'] = sizes;
    data['colors'] = colors;
    data['units'] = units;
    data['unit_id'] = unitId;
    data['printer_id'] = printerId;
    data['costing'] = costing;
    data['pricing'] = pricing;
    data['xtraprice'] = xtraprice;
    data['discount'] = discount;
    data['pvat'] = pvat;
    data['madewith'] = madewith;
    data['product_type'] = productType;
    data['isservice'] = isservice;
    // data['imginfo'] = this.imginfo;
    if (imginfo != null) {
      data['imginfo'] = imginfo!.toJson();
    }
    data['display'] = display;
    data['title'] = title;
    data['category'] = category;
    data['unit'] = unit;
    data['expireddate'] = expireddate;
    data['dfpricing'] = dfpricing;
    data['priceformat'] = priceformat;
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
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
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
    data['from'] = from;
    data['to'] = to;
    data['total'] = total;
    data['perpage'] = perpage;
    data['lastpage'] = lastpage;
    return data;
  }
}

class ImageInfo {
  final int id;
  final String productId;
  final int fileCategoryId;
  final String fileName;
  final String filepath;
  final String fType;
  final int fWidth;
  final int fHeight;
  final String scrName;
  final bool asCover;
  final bool asBg;
  final String title;
  final int ordering;
  final String picColor;
  final String tag;
  final int blongTo;

  ImageInfo({
    required this.id,
    required this.productId,
    required this.fileCategoryId,
    required this.fileName,
    required this.filepath,
    required this.fType,
    required this.fWidth,
    required this.fHeight,
    required this.scrName,
    required this.asCover,
    required this.asBg,
    required this.title,
    required this.ordering,
    required this.picColor,
    required this.tag,
    required this.blongTo,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      id: json['id'],
      productId: json['product_id'],
      fileCategoryId: json['filecategory_id'],
      fileName: json['file_name'],
      filepath: json['filepath'],
      fType: json['f_type'],
      fWidth: json['fwidth'],
      fHeight: json['fheight'],
      scrName: json['scr_name'],
      asCover: json['as_cover'] == "1",
      asBg: json['as_bg'] == "0",
      title: json['title'],
      ordering: json['ordering'],
      picColor: json['piccolor'],
      tag: json['tag'],
      blongTo: json['blongto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'filecategory_id': fileCategoryId,
      'file_name': fileName,
      'filepath': filepath,
      'f_type': fType,
      'fwidth': fWidth,
      'fheight': fHeight,
      'scr_name': scrName,
      'as_cover': asCover ? "1" : "0",
      'as_bg': asBg ? "0" : "1",
      'title': title,
      'ordering': ordering,
      'piccolor': picColor,
      'tag': tag,
      'blongto': blongTo,
    };
  }
}

class MyData {
  final bool isService;
  final List<ImageInfo> imgInfo;
  final String display;

  MyData({
    required this.isService,
    required this.imgInfo,
    required this.display,
  });

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      isService: json['isservice'] == "yes",
      imgInfo:
          (jsonDecode(json['imginfo']) as List)
              .map((e) => ImageInfo.fromJson(e))
              .toList(),
      display: json['display'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isservice': isService ? "yes" : "no",
      'imginfo': jsonEncode(imgInfo.map((e) => e.toJson()).toList()),
      'display': display,
    };
  }
}

void main() {
  String jsonString = '''
  {
    "isservice": "yes",
    "imginfo": "[{\\"id\\":271,\\"product_id\\":\\"441\\",\\"filecategory_id\\":0,\\"file_name\\":\\"1686646303_AR-104.jpg\\",\\"filepath\\":\\"https:\\/\\/airlyo.com\\/storage\\/app\\/public\\/pfk\\/1686646303_AR-104.jpg\\",\\"f_type\\":\\"\\",\\"fwidth\\":0,\\"fheight\\":0,\\"scr_name\\":\\"\\",\\"as_cover\\":\\"1\\",\\"as_bg\\":\\"0\\",\\"title\\":\\"\\",\\"ordering\\":0,\\"piccolor\\":\\"\\",\\"tag\\":\\"\\",\\"blongto\\":1}]",
    "display": ""
  }
  ''';

  Map<String, dynamic> jsonData = jsonDecode(jsonString);
  MyData myData = MyData.fromJson(jsonData);

  print(myData.imgInfo[0].fileName); // Output: 1686646303_AR-104.jpg
}
