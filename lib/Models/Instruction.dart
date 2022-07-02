import 'dart:convert';

Instruction instructionFromJson(String str) => Instruction.fromJson(json.decode(str));

String instructionToJson(Instruction data) => json.encode(data.toJson());

class Instruction {
  Instruction({
    required this.stepNumber,
    required this.instruction,
  });

  int stepNumber;
  String instruction;

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
    stepNumber: json["stepNumber"],
    instruction: json["instruction"],
  );

  Map<String, dynamic> toJson() => {
    "stepNumber": stepNumber,
    "instruction": instruction,
  };
}
