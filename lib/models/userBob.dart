class UserBob {
  final DateTime date;
  final int age;
  UserBob({required this.date, required this.age});
  factory UserBob.fromMap(Map<String, dynamic> json) {
    return UserBob(date: DateTime.parse(json['date']), age: json['age']);
  }
}
