
class GetPopularCategoryData {
    final List<PopluarItem>? documents;

    GetPopularCategoryData({
        this.documents,
    });

    GetPopularCategoryData copyWith({
        List<PopluarItem>? documents,
    }) => 
        GetPopularCategoryData(
            documents: documents ?? this.documents,
        );

    factory GetPopularCategoryData.fromJson(Map<String, dynamic> json) => GetPopularCategoryData(
        documents: json["documents"] == null ? [] : List<PopluarItem>.from(json["documents"]!.map((x) => PopluarItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "documents": documents == null ? [] : List<dynamic>.from(documents!.map((x) => x.toJson())),
    };
}

class PopluarItem {
    final String? id;
    final String? title;
    final String? emoji;

    PopluarItem({
        this.id,
        this.title,
        this.emoji,
    });

    PopluarItem copyWith({
        String? id,
        String? title,
        String? emoji,
    }) => 
        PopluarItem(
            id: id ?? this.id,
            title: title ?? this.title,
            emoji: emoji ?? this.emoji,
        );

    factory PopluarItem.fromJson(Map<String, dynamic> json) => PopluarItem(
        id: json["_id"],
        title: json["title"],
        emoji: json["emoji"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "emoji": emoji,
    };
}
