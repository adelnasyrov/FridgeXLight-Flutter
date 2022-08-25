class Recipe {
  int id;
  String category_global;
  String category_local;
  String recipe_name;
  String recipe;
  String recipe_value;
  int time;
  int is_starred;
  String actions;
  String source;
  int calories;
  double proteins;
  double fats;
  double carboh;
  int banned;
  int amountHave;
  double percentageAmountHave;

  Recipe(
      {required this.id,
      required this.category_global,
      required this.category_local,
      required this.recipe_name,
      required this.recipe,
      required this.recipe_value,
      required this.time,
      required this.is_starred,
      required this.actions,
      required this.source,
      required this.calories,
      required this.proteins,
      required this.fats,
      required this.carboh,
      required this.banned,
      required this.amountHave,
      required this.percentageAmountHave});
}
