class Recent {
  int? id;
  String? categoryId;
  String? subcategoryId;
  Null? childcategoryId;
  String? taxId;
  String? brandId;
  String? name;
  String? slug;
  String? sku;
  String? tags;
  Null? video;
  String? sortDetails;
  String? specificationName;
  String? specificationDescription;
  String? isSpecification;
  String? details;
  String? photo;
  String? discountPrice;
  String? previousPrice;
  String? stock;
  String? metaKeywords;
  String? metaDescription;
  String? status;
  Null? isType;
  Null? date;
  Null? file;
  Null? link;
  Null? fileType;
  String? createdAt;
  String? updatedAt;
  Null? licenseName;
  Null? licenseKey;
  String? itemType;
  String? thumbnail;

  Recent(
      {this.id,
      this.categoryId,
      this.subcategoryId,
      this.childcategoryId,
      this.taxId,
      this.brandId,
      this.name,
      this.slug,
      this.sku,
      this.tags,
      this.video,
      this.sortDetails,
      this.specificationName,
      this.specificationDescription,
      this.isSpecification,
      this.details,
      this.photo,
      this.discountPrice,
      this.previousPrice,
      this.stock,
      this.metaKeywords,
      this.metaDescription,
      this.status,
      this.isType,
      this.date,
      this.file,
      this.link,
      this.fileType,
      this.createdAt,
      this.updatedAt,
      this.licenseName,
      this.licenseKey,
      this.itemType,
      this.thumbnail});

  factory Recent.fromJson(Map<String, dynamic> json) {
    return Recent(
    id : json['id'],
    categoryId : json['category_id'],
    subcategoryId : json['subcategory_id'],
    childcategoryId : json['childcategory_id'],
    taxId : json['tax_id'],
    brandId : json['brand_id'],
    name : json['name'],
    slug : json['slug'],
    sku : json['sku'],
    tags : json['tags'],
    video : json['video'],
    sortDetails : json['sort_details'],
    specificationName : json['specification_name'],
    specificationDescription : json['specification_description'],
    isSpecification : json['is_specification'],
    details : json['details'],
    photo : json['photo'],
    discountPrice : json['discount_price'],
    previousPrice : json['previous_price'],
    stock : json['stock'],
    metaKeywords : json['meta_keywords'],
    metaDescription : json['meta_description'],
    status : json['status'],
    isType : json['is_type'],
    date : json['date'],
    file : json['file'],
    link : json['link'],
    fileType : json['file_type'],
    createdAt : json['created_at'],
    updatedAt : json['updated_at'],
    licenseName : json['license_name'],
    licenseKey : json['license_key'],
    itemType : json['item_type'],
    thumbnail : json['thumbnail']
    );
  }

}