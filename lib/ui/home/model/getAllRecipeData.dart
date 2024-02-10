class GetAllRecipeData {
  List<RecipeItem>? _documents;

  GetAllRecipeData({List<RecipeItem>? documents}) {
    if (documents != null) {
      this._documents = documents;
    }
  }

  List<RecipeItem>? get documents => _documents;
  set documents(List<RecipeItem>? documents) => _documents = documents;

  GetAllRecipeData.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      _documents = <RecipeItem>[];
      json['documents'].forEach((v) {
        _documents!.add(new RecipeItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._documents != null) {
      data['documents'] = this._documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecipeItem {
  String? _sId;
  String? _recipeId;
  String? _name;
  List<Instruction>? _instruction;
  Nutrition? _nutrition;
  String? _image;
  String? _videoLink;
  String? _totalTime;
  String? _country;
  String? _serving;
  List<Ingredients>? _ingredients;
  List<String>? _recipeKeyword;
  String? _category;

  RecipeItem(
      {String? sId,
      String? recipeId,
      String? name,
      List<Instruction>? instruction,
      Nutrition? nutrition,
      String? image,
      String? videoLink,
      String? totalTime,
      String? country,
      String? serving,
      List<Ingredients>? ingredients,
      List<String>? recipeKeyword,
      String? category}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (recipeId != null) {
      this._recipeId = recipeId;
    }
    if (name != null) {
      this._name = name;
    }
    if (instruction != null) {
      this._instruction = instruction;
    }
    if (nutrition != null) {
      this._nutrition = nutrition;
    }
    if (image != null) {
      this._image = image;
    }
    if (videoLink != null) {
      this._videoLink = videoLink;
    }
    if (totalTime != null) {
      this._totalTime = totalTime;
    }
    if (country != null) {
      this._country = country;
    }
    if (serving != null) {
      this._serving = serving;
    }
    if (ingredients != null) {
      this._ingredients = ingredients;
    }
    if (recipeKeyword != null) {
      this._recipeKeyword = recipeKeyword;
    }
    if (category != null) {
      this._category = category;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get recipeId => _recipeId;
  set recipeId(String? recipeId) => _recipeId = recipeId;
  String? get name => _name;
  set name(String? name) => _name = name;
  List<Instruction>? get instruction => _instruction;
  set instruction(List<Instruction>? instruction) => _instruction = instruction;
  Nutrition? get nutrition => _nutrition;
  set nutrition(Nutrition? nutrition) => _nutrition = nutrition;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get videoLink => _videoLink;
  set videoLink(String? videoLink) => _videoLink = videoLink;
  String? get totalTime => _totalTime;
  set totalTime(String? totalTime) => _totalTime = totalTime;
  String? get country => _country;
  set country(String? country) => _country = country;
  String? get serving => _serving;
  set serving(String? serving) => _serving = serving;
  List<Ingredients>? get ingredients => _ingredients;
  set ingredients(List<Ingredients>? ingredients) => _ingredients = ingredients;
  List<String>? get recipeKeyword => _recipeKeyword;
  set recipeKeyword(List<String>? recipeKeyword) =>
      _recipeKeyword = recipeKeyword;
  String? get category => _category;
  set category(String? category) => _category = category;

  RecipeItem.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _recipeId = json['recipe_id'];
    _name = json['name'];
    if (json['instruction'] != null) {
      _instruction = <Instruction>[];
      json['instruction'].forEach((v) {
        _instruction!.add(new Instruction.fromJson(v));
      });
    }
    _nutrition = json['nutrition'] != null
        ? new Nutrition.fromJson(json['nutrition'])
        : null;
    _image = json['image'];
    _videoLink = json['video_link'];
    _totalTime = json['total_time'];
    _country = json['country'];
    _serving = json['serving'];
    if (json['ingredients'] != null) {
      _ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        _ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    _recipeKeyword = json['recipe_keyword'].cast<String>();
    _category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['recipe_id'] = this._recipeId;
    data['name'] = this._name;
    if (this._instruction != null) {
      data['instruction'] = this._instruction!.map((v) => v.toJson()).toList();
    }
    if (this._nutrition != null) {
      data['nutrition'] = this._nutrition!.toJson();
    }
    data['image'] = this._image;
    data['video_link'] = this._videoLink;
    data['total_time'] = this._totalTime;
    data['country'] = this._country;
    data['serving'] = this._serving;
    if (this._ingredients != null) {
      data['ingredients'] = this._ingredients!.map((v) => v.toJson()).toList();
    }
    data['recipe_keyword'] = this._recipeKeyword;
    data['category'] = this._category;
    return data;
  }
}

class Instruction {
  String? _displayText;
  String? _position;

  Instruction({String? displayText, String? position}) {
    if (displayText != null) {
      this._displayText = displayText;
    }
    if (position != null) {
      this._position = position;
    }
  }

  String? get displayText => _displayText;
  set displayText(String? displayText) => _displayText = displayText;
  String? get position => _position;
  set position(String? position) => _position = position;

  Instruction.fromJson(Map<String, dynamic> json) {
    _displayText = json['display_text'];
    _position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_text'] = this._displayText;
    data['position'] = this._position;
    return data;
  }
}

class Nutrition {
  int? _fat;
  int? _calories;
  int? _sugar;
  int? _carbohydrates;
  int? _fiber;
  int? _protein;

  Nutrition(
      {int? fat,
      int? calories,
      int? sugar,
      int? carbohydrates,
      int? fiber,
      int? protein}) {
    if (fat != null) {
      this._fat = fat;
    }
    if (calories != null) {
      this._calories = calories;
    }
    if (sugar != null) {
      this._sugar = sugar;
    }
    if (carbohydrates != null) {
      this._carbohydrates = carbohydrates;
    }
    if (fiber != null) {
      this._fiber = fiber;
    }
    if (protein != null) {
      this._protein = protein;
    }
  }

  int? get fat => _fat;
  set fat(int? fat) => _fat = fat;
  int? get calories => _calories;
  set calories(int? calories) => _calories = calories;
  int? get sugar => _sugar;
  set sugar(int? sugar) => _sugar = sugar;
  int? get carbohydrates => _carbohydrates;
  set carbohydrates(int? carbohydrates) => _carbohydrates = carbohydrates;
  int? get fiber => _fiber;
  set fiber(int? fiber) => _fiber = fiber;
  int? get protein => _protein;
  set protein(int? protein) => _protein = protein;

  Nutrition.fromJson(Map<String, dynamic> json) {
    _fat = json['fat'];
    _calories = json['calories'];
    _sugar = json['sugar'];
    _carbohydrates = json['carbohydrates'];
    _fiber = json['fiber'];
    _protein = json['protein'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fat'] = this._fat;
    data['calories'] = this._calories;
    data['sugar'] = this._sugar;
    data['carbohydrates'] = this._carbohydrates;
    data['fiber'] = this._fiber;
    data['protein'] = this._protein;
    return data;
  }
}

class Ingredients {
  String? _ingredientName;
  String? _extraComment;
  Unit1? _unit1;
  Unit1? _unit2;

  Ingredients(
      {String? ingredientName,
      String? extraComment,
      Unit1? unit1,
      Unit1? unit2}) {
    if (ingredientName != null) {
      this._ingredientName = ingredientName;
    }
    if (extraComment != null) {
      this._extraComment = extraComment;
    }
    if (unit1 != null) {
      this._unit1 = unit1;
    }
    if (unit2 != null) {
      this._unit2 = unit2;
    }
  }

  String? get ingredientName => _ingredientName;
  set ingredientName(String? ingredientName) =>
      _ingredientName = ingredientName;
  String? get extraComment => _extraComment;
  set extraComment(String? extraComment) => _extraComment = extraComment;
  Unit1? get unit1 => _unit1;
  set unit1(Unit1? unit1) => _unit1 = unit1;
  Unit1? get unit2 => _unit2;
  set unit2(Unit1? unit2) => _unit2 = unit2;

  Ingredients.fromJson(Map<String, dynamic> json) {
    _ingredientName = json['ingredient_name'];
    _extraComment = json['extra_comment'];
    _unit1 = json['unit_1'] != null ? new Unit1.fromJson(json['unit_1']) : null;
    _unit2 = json['unit_2'] != null ? new Unit1.fromJson(json['unit_2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ingredient_name'] = this._ingredientName;
    data['extra_comment'] = this._extraComment;
    if (this._unit1 != null) {
      data['unit_1'] = this._unit1!.toJson();
    }
    if (this._unit2 != null) {
      data['unit_2'] = this._unit2!.toJson();
    }
    return data;
  }
}

class Unit1 {
  String? _unit;
  String? _quantity;

  Unit1({String? unit, String? quantity}) {
    if (unit != null) {
      this._unit = unit;
    }
    if (quantity != null) {
      this._quantity = quantity;
    }
  }

  String? get unit => _unit;
  set unit(String? unit) => _unit = unit;
  String? get quantity => _quantity;
  set quantity(String? quantity) => _quantity = quantity;

  Unit1.fromJson(Map<String, dynamic> json) {
    _unit = json['unit'];
    _quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this._unit;
    data['quantity'] = this._quantity;
    return data;
  }
}
