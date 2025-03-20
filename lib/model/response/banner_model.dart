import 'dart:convert';

class BannerModel {
  int? id;
  String? barcode;
  String? productcode;
  String? title;
  ImageInfo? imginfo;
  String? productType;
  int? categoryId;
  String? categories;
  int? unitId;
  String? units;
  String? status;
  int? permissionId;
  String? permissionPassword;
  int? parentId;
  String? madewith;
  String? costing;
  String? pricing;
  String? sizes;
  String? colors;
  String? xtraprice;
  int? discount;
  int? pSeries;
  int? pLocation;
  int? moduleId;
  String? attEle;
  String? extraFields;
  String? extra;
  String? extraFix;
  int? visitorCounter;
  String? createdAt;
  String? updatedAt;
  String? postDate;
  String? expiredDate;
  String? pageId;
  int? branchId;
  int? ordering;
  String? trash;
  int? blongto;
  int? productId;
  String? lgCode;
  String? translate;
  String? password;

  BannerModel({
    this.id,
    this.barcode,
    this.productcode,
    this.title,
    this.imginfo,
    this.productType,
    this.categoryId,
    this.categories,
    this.unitId,
    this.units,
    this.status,
    this.permissionId,
    this.permissionPassword,
    this.parentId,
    this.madewith,
    this.costing,
    this.pricing,
    this.sizes,
    this.colors,
    this.xtraprice,
    this.discount,
    this.pSeries,
    this.pLocation,
    this.moduleId,
    this.attEle,
    this.extraFields,
    this.extra,
    this.extraFix,
    this.visitorCounter,
    this.createdAt,
    this.updatedAt,
    this.postDate,
    this.expiredDate,
    this.pageId,
    this.branchId,
    this.ordering,
    this.trash,
    this.blongto,
    this.productId,
    this.lgCode,
    this.translate,
    this.password,
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barcode = json['barcode'];
    productcode = json['productcode'];
    title = json['title'];
    if (json['imginfo'] != null) {
      if (json['imginfo'] is String) {
        List<dynamic> imgList = jsonDecode(json['imginfo']);
        imginfo = imgList.isNotEmpty ? ImageInfo.fromJson(imgList[0]) : null;
      } else if (json['imginfo'] is List) {
        imginfo =
            json['imginfo'].isNotEmpty
                ? ImageInfo.fromJson(json['imginfo'][0])
                : null;
      } else if (json['imginfo'] is Map) {
        imginfo = ImageInfo.fromJson(json['imginfo']);
      }
    }
    productType = json['product_type'];
    categoryId = json['category_id'];
    categories = json['categories'];
    unitId = json['unit_id'];
    units = json['units'];
    status = json['status'];
    permissionId = json['permission_id'];
    permissionPassword = json['permission_password'];
    parentId = json['parent_id'];
    madewith = json['madewith'];
    costing = json['costing'];
    pricing = json['pricing'];
    sizes = json['sizes'];
    colors = json['colors'];
    xtraprice = json['xtraprice'];
    discount = json['discount'];
    pSeries = json['p_series'];
    pLocation = json['p_location'];
    moduleId = json['module_id'];
    attEle = json['att_ele'];
    extraFields = json['extra_fields'];
    extra = json['extra'];
    extraFix = json['extra_fix'];
    visitorCounter = json['visitor_counter'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    postDate = json['post_date'];
    expiredDate = json['expired_date'];
    pageId = json['page_id'];
    branchId = json['branch_id'];
    ordering = json['ordering'];
    trash = json['trash'];
    blongto = json['blongto'];
    productId = json['product_id'];
    lgCode = json['lg_code'];
    translate = json['translate'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['barcode'] = barcode;
    data['productcode'] = productcode;
    data['title'] = title;
    if (imginfo != null) {
      data['imginfo'] = imginfo!.toJson();
    }
    data['product_type'] = productType;
    data['category_id'] = categoryId;
    data['categories'] = categories;
    data['unit_id'] = unitId;
    data['units'] = units;
    data['status'] = status;
    data['permission_id'] = permissionId;
    data['permission_password'] = permissionPassword;
    data['parent_id'] = parentId;
    data['madewith'] = madewith;
    data['costing'] = costing;
    data['pricing'] = pricing;
    data['sizes'] = sizes;
    data['colors'] = colors;
    data['xtraprice'] = xtraprice;
    data['discount'] = discount;
    data['p_series'] = pSeries;
    data['p_location'] = pLocation;
    data['module_id'] = moduleId;
    data['att_ele'] = attEle;
    data['extra_fields'] = extraFields;
    data['extra'] = extra;
    data['extra_fix'] = extraFix;
    data['visitor_counter'] = visitorCounter;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['post_date'] = postDate;
    data['expired_date'] = expiredDate;
    data['page_id'] = pageId;
    data['branch_id'] = branchId;
    data['ordering'] = ordering;
    data['trash'] = trash;
    data['blongto'] = blongto;
    data['product_id'] = productId;
    data['lg_code'] = lgCode;
    data['translate'] = translate;
    data['password'] = password;
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
