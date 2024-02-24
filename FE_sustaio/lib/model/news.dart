import 'package:intl/intl.dart';

class News {
  final String title;
  final String categories;
  final String description;
  final String imageUrl;
  final String address;
  final DateTime timeCreate;

  News({
    required this.title,
    required this.categories,
    required this.description,
    required this.imageUrl,
    required this.address,
    required this.timeCreate,
  });
  String formattedTimeCreate() {
    return DateFormat('dd/MM/yyyy').format(timeCreate);
  }
}
