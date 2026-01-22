class HomeModel {
	String? id;
	String? title;
	String? description;
	String? imageUrl;
	String? imagePublicId;
	DateTime? createdAt;
	DateTime? updatedAt;
	int? v;

	HomeModel({
		this.id, 
		this.title, 
		this.description, 
		this.imageUrl, 
		this.imagePublicId, 
		this.createdAt, 
		this.updatedAt, 
		this.v, 
	});

	factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
				id: json['_id'] as String?,
				title: json['title'] as String?,
				description: json['description'] as String?,
				imageUrl: json['imageUrl'] as String?,
				imagePublicId: json['imagePublicId'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
				v: json['__v'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'title': title,
				'description': description,
				'imageUrl': imageUrl,
				'imagePublicId': imagePublicId,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
				'__v': v,
			};
}
