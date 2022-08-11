class Savings {
  final String title;
  final String description;
  final double savings;
  final double goal;
  bool isCompleted;

  Savings(
    this.title,
    this.description,
    this.savings,
    this.goal, {
    this.isCompleted = false,
  });

  Savings.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        savings = json['savings'],
        goal = json['goal'],
        isCompleted = json['isCompleted'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'savings': savings,
        'goal': goal,
        'isCompleted': isCompleted
      };
}
