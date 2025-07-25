Future<Map<int, CriteriaDto>> getCriteria() async {
  final criteria = ['Обслуговування', 'Асортимент'];

  await Future<void>.delayed(const Duration(seconds: 1));
  return Future.value(
    {
      1: CriteriaDto(title: 'Овочі, фрукти', criterias: criteria),
      2: CriteriaDto(title: 'Випічка', criterias: [...criteria, 'Свіжість']),
      3: CriteriaDto(title: 'Лавка традицій', criterias: criteria),
      4: CriteriaDto(title: 'Напої', criterias: criteria),
      5: CriteriaDto(title: 'Кава, чай', criterias: criteria),
      6: CriteriaDto(title: 'Солодощі', criterias: criteria),
    },
  );
}

class CriteriaDto {
  CriteriaDto({
    required this.title,
    required this.criterias,
  });

  final String title;
  final List<String> criterias;
}
