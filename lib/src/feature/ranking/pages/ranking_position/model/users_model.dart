import 'package:my_total_fit/src/common/constents/app_images.dart';

class LeaderboardEntry {
  final int rank;
  final String name;
  final int points;
  final String countryFlag;
  final String avatarUrl;
  final String medal;
  final bool isGold;
  final bool isSilver;
  final bool isBronze;

  LeaderboardEntry({
    required this.rank,
    required this.medal,
    required this.name,
    required this.points,
    required this.countryFlag,
    required this.avatarUrl,
    this.isGold = false,
    this.isSilver = false,
    this.isBronze = false,
  });
}

List<LeaderboardEntry> leaderboardData = [
  LeaderboardEntry(
      rank: 1,
      name: 'Davis Curtis',
      points: 2569,
      medal: AppIcons.goldmedel,
      countryFlag: AppIcons.flag3,
      avatarUrl: AppImages.profile1,
      isGold: true),
  LeaderboardEntry(
      rank: 2,
      name: 'Alena Donin',
      medal: AppIcons.silvermedel,
      points: 1469,
      countryFlag: AppIcons.flag3,
      avatarUrl: AppImages.profile2,
      isSilver: true),
  LeaderboardEntry(
      rank: 3,
      name: 'Craig Gouse',
      points: 1053,
      medal: AppIcons.bronzmedel,
      countryFlag: AppIcons.flag3,
      avatarUrl: AppImages.profile3,
      isBronze: true),
  LeaderboardEntry(
    rank: 4,
    name: 'Madelyn Dias',
    medal: AppIcons.silvermedel,
    points: 590,
    countryFlag: AppIcons.flag3,
    avatarUrl: AppImages.profile1,
  ),
  LeaderboardEntry(
    rank: 5,
    name: 'Zain Vaccaro',
    medal: AppIcons.silvermedel,
    points: 448,
    countryFlag: AppIcons.flag2,
    avatarUrl: AppImages.profile1,
  ),
  LeaderboardEntry(
    rank: 6,
    name: 'Skylar Geidt',
    medal: AppIcons.silvermedel,
    points: 448,
    countryFlag: AppIcons.flag1,
    avatarUrl: AppImages.profile1,
  ),
];
