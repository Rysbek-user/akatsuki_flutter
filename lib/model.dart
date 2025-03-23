import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class AkatsukiInfo extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<String> images;

  @HiveField(2)
  final List<String> jutsu;

  const AkatsukiInfo({
    required this.name,
    required this.images,
    required this.jutsu,
  });

  @override
  List<Object> get props => [name, images, jutsu];

  factory AkatsukiInfo.fromJson(Map<String, dynamic> json) {
    return AkatsukiInfo(
      name: json['name'] as String,
      images: List<String>.from(json['images'] ?? []),
      jutsu: List<String>.from(json['jutsu'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'images': images, 'jutsu': jutsu};
  }
}
