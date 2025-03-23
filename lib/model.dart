import 'package:equatable/equatable.dart';

class AkatsukiInfo extends Equatable {
  const AkatsukiInfo({
    required this.name,
    required this.images,
    required this.jutsu,
  });

  final String name;
  final List<String> images;
  final List<String> jutsu;

  @override
  List<Object> get props => [name, images, jutsu];

  factory AkatsukiInfo.fromJson(Map<String, dynamic> json) {
    return AkatsukiInfo(
      name: json['name'] as String,
      images: List<String>.from(json['images'] ?? []),
      jutsu: List<String>.from(json['jutsu'] ?? []),
    );
  }
}