import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calbirthdate/classLogic.dart';
import 'package:calbirthdate/classLogic.dart';
import 'package:flutter/material.dart';

sealed class Date {}

class Birthdate extends Date {
  DateTime date;
  Birthdate({required this.date});
}

class CalBirth extends Date {}

class BirthBloc extends Bloc<Date, BirthdateLogic> {
  int year = 0;
  int birthdate = 0;
  int dayDate = 0;
  int mothdate = 0;
  int month = 0;
  int day = 0;
  BirthBloc()
      : super(
            BirthdateLogic(birthdate: DateTime(0), year: 0, day: 0, month: 0)) {
    on<Birthdate>((event, emit) {
      birthdate = event.date.year;
      mothdate = event.date.month;
      dayDate = event.date.day;
    });
    on<CalBirth>((event, emit) {
      year = state.current.year - birthdate;
      month = state.current.month - mothdate;
      day = state.current.day - dayDate;
      if (day < 0) {
        month -= 1;
        day += 30;
      }
      if (month < 0) {
        year -= 1;
        month += 12;
      }

      emit(state.birthDate(y: year, m: month, d: day));
    });
  }
}
