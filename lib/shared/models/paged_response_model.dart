class PagedResponse<T> {
  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;

  PagedResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PagedResponse.fromJson(Map<String, dynamic> json) {
    return PagedResponse(
      page: json['page'] as int,
      results: (json['results'] as List).map((item) => item as T).toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }
}
