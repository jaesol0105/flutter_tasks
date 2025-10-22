class ToDoEntity {
  String title;
  String? description;
  bool isFavorite;
  bool isDone;
  DateTime? due;

  ToDoEntity(this.title, this.description, this.isFavorite, this.isDone);
}
