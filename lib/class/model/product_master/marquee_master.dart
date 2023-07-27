List<Marquees> marqueeFromJson(dynamic jsonData) =>
    List<Marquees>.from(jsonData['Data'].map((e) => Marquees.fromMap(e)));

class Marquees {
  final String id;
  final String name;
  final String status;
  final String date;

//<editor-fold desc="Data Methods">
  const Marquees({
    required this.id,
    required this.name,
    required this.status,
    required this.date,
  });
  Marquees copyWith({
    String? id,
    String? name,
    String? status,
    String? date,
  }) {
    return Marquees(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'date': date,
    };
  }

  factory Marquees.fromMap(Map<String, dynamic> map) {
    return Marquees(
      id: map['id'] as String,
      name: map['name'] as String,
      status: map['status'] as String,
      date: map['date'] as String,
    );
  }

//</editor-fold>
}
