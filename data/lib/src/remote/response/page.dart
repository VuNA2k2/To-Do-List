import 'package:domain/domain.dart';

class Page<T> {
  int totals;
  List<T> items;

  Page({this.totals = 0, this.items = const []});

  factory Page.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    return Page(
      totals: json['totals'],
      items: List<T>.from(
        json["items"].map((x) => fromJson(x)),
      ),
    );
  }
}

class PageRQ {
  int page;
  int size;

  PageRQ({this.page = 0, this.size = 0});

  Map<String, dynamic> toJson() {
    return {
      "page": page,
      "size": size,
    };
  }
}

class PageMapper {
  static PageRQ fromEntity(PageRQEntity pageRQ) {
    return PageRQ(
      page: pageRQ.page,
      size: pageRQ.size,
    );
  }
}
