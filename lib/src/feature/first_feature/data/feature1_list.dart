// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class FeatureOne {
  static const lableList = [
    'Future Provider',
    'Stream Provider',
    'State Provider',
    'State Notifier',
    'Change Notifier',
  ];
}

class StateNotifierModel extends Equatable {
  final String value;
  final bool check;
  const StateNotifierModel({
    required this.value,
    required this.check,
  });

  StateNotifierModel copyWith({
    String? value,
    bool? check,
  }) {
    return StateNotifierModel(
      value: value ?? this.value,
      check: check ?? this.check,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'check': check,
    };
  }

  factory StateNotifierModel.fromMap(Map<String, dynamic> map) {
    return StateNotifierModel(
      value: map['value'] as String,
      check: map['check'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory StateNotifierModel.fromJson(String source) =>
      StateNotifierModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [value, check];
}
