// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Problem {
  String id;
  String? thema;
  int? bewertung;
  String? customerName;
  String? message;
  Problem({
    required this.id,
    this.thema,
    this.bewertung,
    this.customerName,
    this.message,
  });

  Problem copyWith({
    String? id,
    String? thema,
    int? bewertung,
    String? customerName,
    String? message,
  }) {
    return Problem(
      id: id ?? this.id,
      thema: thema ?? this.thema,
      bewertung: bewertung ?? this.bewertung,
      customerName: customerName ?? this.customerName,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'thema': thema,
      'bewertung': bewertung,
      'customerName': customerName,
      'message': message,
    };
  }

  factory Problem.fromMap(Map<String, dynamic> map) {
    return Problem(
      id: map['id'] as String,
      thema: map['thema'] != null ? map['thema'] as String : null,
      bewertung: map['bewertung'] != null ? map['bewertung'] as int : null,
      customerName:
          map['customerName'] != null ? map['customerName'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Problem.fromJson(String source) =>
      Problem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Problem(id: $id, thema: $thema, bewertung: $bewertung, customerName: $customerName, message: $message)';
  }

  @override
  bool operator ==(covariant Problem other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.thema == thema &&
        other.bewertung == bewertung &&
        other.customerName == customerName &&
        other.message == message;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        thema.hashCode ^
        bewertung.hashCode ^
        customerName.hashCode ^
        message.hashCode;
  }
}
