class Welcome {
  Welcome({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
