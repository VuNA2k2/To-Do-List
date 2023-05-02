class PageRQEntity {
  int page;
  int size;
  PageRQEntity({this.page = 0, this.size = 0});
}

class PageRS<T> {
  int total;
  List<T> items;

  PageRS({this.total = 0, this.items = const []});
}