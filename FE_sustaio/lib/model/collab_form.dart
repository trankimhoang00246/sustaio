import 'package:gdsc_2024/model/category.dart';
import 'package:gdsc_2024/model/user.dart';

class Collab {
  final int id;
  final String content;
  final String otherContent;
  final String descEnterprise;
  final String address;
  final bool verified;
  final String coverImageUrl;

  final Category categoryDto;
  final User userDto;

  Collab({
    required this.id,
    required this.content,
    required this.otherContent,
    required this.descEnterprise,
    required this.address,
    required this.verified,
    required this.coverImageUrl,
    required this.categoryDto,
    required this.userDto,
  });
}


