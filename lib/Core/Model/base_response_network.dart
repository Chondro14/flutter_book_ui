class BaseResponseNetwork<T> {
  int count;
  String? next;
  String? previous;
  T results;
  String? details;

  BaseResponseNetwork(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results,
      this.details});

  factory BaseResponseNetwork.fromJson(
    Map<dynamic, dynamic> json,
    Function fromJson,
  ) =>
      BaseResponseNetwork(
          count: json["count"],
          next: json["next"],
          previous: json["previous"],
          results: fromJson(json["results"]),
          details: json["detail"] ?? "");
}
