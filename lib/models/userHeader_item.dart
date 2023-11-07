// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserHeaderItem {
  final int rank;
  final String imageUrl;
  final String name;
  final int points;

  UserHeaderItem({
    required this.rank,
    required this.imageUrl,
    required this.name,
    required this.points,
  });

  UserHeaderItem copyWith({
    int? rank,
    String? imageUrl,
    String? name,
    int? points,
  }) {
    return UserHeaderItem(
      rank: rank ?? this.rank,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      points: points ?? this.points,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rank': rank,
      'imageUrl': imageUrl,
      'name': name,
      'points': points,
    };
  }

  factory UserHeaderItem.fromMap(Map<String, dynamic> map) {
    return UserHeaderItem(
      rank: map['rank'] as int,
      imageUrl: map['imageUrl'] as String,
      name: map['name'] as String,
      points: map['points'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserHeaderItem.fromJson(String source) => UserHeaderItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserHeaderItem(rank: $rank, imageUrl: $imageUrl, name: $name, points: $points)';
  }

  @override
  bool operator ==(covariant UserHeaderItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.rank == rank &&
      other.imageUrl == imageUrl &&
      other.name == name &&
      other.points == points;
  }

  @override
  int get hashCode {
    return rank.hashCode ^
      imageUrl.hashCode ^
      name.hashCode ^
      points.hashCode;
  }
}
