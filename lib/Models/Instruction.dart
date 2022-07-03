class Instruction {
  Instruction({
    this.id,
    required this.stepNumber,
    required this.instruction,
  });

  int? id;
  int stepNumber;
  String instruction;

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
    id: json["id"],
    stepNumber: json["stepNumber"],
    instruction: json["instruction"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "stepNumber": stepNumber,
    "instruction": instruction,
  };
}