class FailureEntity {
  const FailureEntity({
    this.message,
    this.statusCode,
  });

  final String? message;
  final int? statusCode;

  factory FailureEntity.fromJson(
    final Map<String, dynamic> json,
    final int? statusCode,
  ) {
    final failure = json['error'];
    return FailureEntity(
      message: (failure is int ? failure.toString() : failure),
      statusCode: statusCode,
    );
  }

  Map<String, dynamic> toJson() => {
        'error': message,
        'statusCode': statusCode,
      };

  @override
  String toString() => '''
  FailureEntity{
   message:     $message
   statusCode:  $statusCode   
   }
  ''';
}
