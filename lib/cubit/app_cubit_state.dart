import 'package:flutter/cupertino.dart';

@immutable
sealed class AppcubitState {}

final class AppcubitInitial extends AppcubitState {}

final class AppChangeModeState extends AppcubitState {}