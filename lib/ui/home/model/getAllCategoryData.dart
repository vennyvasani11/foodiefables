
class GetAllCategoryData {
    final List<CategoryItem>? documents;

    GetAllCategoryData({
        this.documents,
    });

    factory GetAllCategoryData.fromJson(Map<String, dynamic> json) => GetAllCategoryData(
        documents: List<CategoryItem>.from(json["documents"].map((x) => CategoryItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "documents": List<dynamic>.from(documents!.map((x) => x.toJson())),
    };
}

class CategoryItem {
    final String? id;
    final String? image;
    final String? title;

    CategoryItem({
        this.id,
        this.image,
        this.title,
    });

    factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        id: json["_id"],
        image: json["image"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "title": title,
    };
}
