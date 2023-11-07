class RankingItem {
  final int rank;
  final String avatarUrl;
  final String name;
  final String points;
  final bool hasAdvanced;
  final bool hasDecreased;

  RankingItem({
    required this.rank,
    required this.avatarUrl,
    required this.name,
    required this.points,
    required this.hasAdvanced,
    required this.hasDecreased,
  });
}