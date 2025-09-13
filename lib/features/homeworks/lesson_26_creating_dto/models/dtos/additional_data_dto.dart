import 'package:json_annotation/json_annotation.dart';

part 'additional_data_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class AdditionalDataDto {
  AdditionalDataDto({
    required this.id,
    required this.title,
    required this.icon,
    required this.ratio,
    required this.sectionSlug,
    required this.companyId,
    required this.externalProductId,
    required this.slug,
    required this.classifierSapId,
    required this.brandId,
    required this.brandTitle,
    required this.weighted,
    required this.departmentName,
    required this.barcodes,
    required this.weight,
    required this.scanExcise,
  });

  factory AdditionalDataDto.fromJson(Map<String, dynamic> json) =>
      _$AdditionalDataDtoFromJson(json);

  final String id;
  final String title;
  final String icon;
  final String ratio;
  final String sectionSlug;
  final String companyId;
  final String externalProductId;
  final String slug;
  final String classifierSapId;
  final String? brandId;
  final String? brandTitle;
  final bool weighted;
  final String departmentName;
  final List<String> barcodes;
  final double weight;
  final bool scanExcise;

  Map<String, dynamic> toJson() => _$AdditionalDataDtoToJson(this);
}
