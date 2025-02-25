class ContactModel {
  int? id;
  String? barcode;
  String? productcode;
  String? title;
  String? imginfo;
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

  ContactModel({
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
  });

  ContactModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barcode = json['barcode'];
    productcode = json['productcode'];
    title = json['title'];
    imginfo = json['imginfo'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['barcode'] = this.barcode;
    data['productcode'] = this.productcode;
    data['title'] = this.title;
    data['imginfo'] = this.imginfo;
    data['product_type'] = this.productType;
    data['category_id'] = this.categoryId;
    data['categories'] = this.categories;
    data['unit_id'] = this.unitId;
    data['units'] = this.units;
    data['status'] = this.status;
    data['permission_id'] = this.permissionId;
    data['permission_password'] = this.permissionPassword;
    data['parent_id'] = this.parentId;
    data['madewith'] = this.madewith;
    data['costing'] = this.costing;
    data['pricing'] = this.pricing;
    data['sizes'] = this.sizes;
    data['colors'] = this.colors;
    data['xtraprice'] = this.xtraprice;
    data['discount'] = this.discount;
    data['p_series'] = this.pSeries;
    data['p_location'] = this.pLocation;
    data['module_id'] = this.moduleId;
    data['att_ele'] = this.attEle;
    data['extra_fields'] = this.extraFields;
    data['extra'] = this.extra;
    data['extra_fix'] = this.extraFix;
    data['visitor_counter'] = this.visitorCounter;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['post_date'] = this.postDate;
    data['expired_date'] = this.expiredDate;
    data['page_id'] = this.pageId;
    data['branch_id'] = this.branchId;
    data['ordering'] = this.ordering;
    data['trash'] = this.trash;
    data['blongto'] = this.blongto;
    data['product_id'] = this.productId;
    data['lg_code'] = this.lgCode;
    data['translate'] = this.translate;
    return data;
  }
}
