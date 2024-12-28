import 'package:calbirthdate/calLogic.dart';

class BirthdateLogic {
  DateTime current = DateTime.now();
  DateTime birthdate;
  int year;
  int month;
  int day;
  BirthdateLogic(
      {required this.birthdate,
      required this.year,
      required this.month,
      required this.day});
  BirthdateLogic birthDate({int? y, DateTime? bd, int? d, int? m}) {
    return BirthdateLogic(
        birthdate: bd ?? this.birthdate,
        year: y ?? this.year,
        month: m ?? this.month,
        day: d ?? this.day);
  }
}
