class CatgoryHome {
  int? id;
  String? name;
  String? color;
  String? description;
  String? slug;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  int? inOrder;
  String? formattedDate;
  String? logo;
  String? websiteHeader;

  CatgoryHome(
      {this.id,
        this.name,
        this.color,
        this.description,
        this.slug,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.inOrder,
        this.formattedDate,
        this.logo,
        this.websiteHeader});

  CatgoryHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    description = json['description'];
    slug = json['slug'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    inOrder = json['in_order'];
    formattedDate = json['formatted_date'];
    logo = json['logo'];
    websiteHeader = json['website_header'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['in_order'] = this.inOrder;
    data['formatted_date'] = this.formattedDate;
    data['logo'] = this.logo;
    data['website_header'] = this.websiteHeader;
    return data;
  }
}