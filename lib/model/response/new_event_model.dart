import 'dart:convert';

import 'package:bunny_ngim_app/model/response/banner_model.dart';

class NewEventModel {
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
  dynamic translate;
  String? code;
  String? colorcode;
  String? pic;
  String? display;
  int? attributeId;
  String? printerId;
  String? fixExtra;
  String? name;
  String? email;
  String? phonenumber;
  String? fullname;
  String? emailVerifiedAt;
  String? password;
  String? rememberToken;
  String? apiToken;
  int? groupId;
  int? warehouseId;
  String? locations;
  String? userstatus;
  String? category;

  NewEventModel({
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
    this.code,
    this.colorcode,
    this.pic,
    this.display,
    this.attributeId,
    this.printerId,
    this.fixExtra,
    this.name,
    this.email,
    this.phonenumber,
    this.fullname,
    this.emailVerifiedAt,
    this.password,
    this.rememberToken,
    this.apiToken,
    this.groupId,
    this.warehouseId,
    this.locations,
    this.userstatus,
    this.category,
  });

  NewEventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barcode = json['barcode'];
    productcode = json['productcode'];
    title = json['title'];
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
    translate = jsonDecode(json['translate'].toString());
    code = json['code'];
    colorcode = json['colorcode'];
    pic = json['pic'];
    display = json['display'];
    attributeId = json['attribute_id'];
    printerId = json['printer_id'];
    fixExtra = json['fix_extra'];
    name = json['name'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    fullname = json['fullname'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
    apiToken = json['api_token'];
    groupId = json['group_id'];
    warehouseId = json['warehouse_id'];
    locations = json['locations'];
    userstatus = json['userstatus'];
    category = json['category'];
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
    if (translate != null) {
      data['translate'] = translate!.toJson();
    }
    data['code'] = code;
    data['colorcode'] = colorcode;
    data['pic'] = pic;
    data['display'] = display;
    data['attribute_id'] = attributeId;
    data['printer_id'] = printerId;
    data['fix_extra'] = fixExtra;
    data['name'] = name;
    data['email'] = email;
    data['phonenumber'] = phonenumber;
    data['fullname'] = fullname;
    data['email_verified_at'] = emailVerifiedAt;
    data['password'] = password;
    data['remember_token'] = rememberToken;
    data['api_token'] = apiToken;
    data['group_id'] = groupId;
    data['warehouse_id'] = warehouseId;
    data['locations'] = locations;
    data['userstatus'] = userstatus;
    data['category'] = category;
    return data;
  }
}
