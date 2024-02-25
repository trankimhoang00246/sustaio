// Example user data
import 'package:gdsc_2024/model/category.dart';
import 'package:gdsc_2024/model/collab_form.dart';
import 'package:gdsc_2024/model/user.dart';
import 'package:gdsc_2024/services/collab_service.dart';

  final Future<List<Collab>> collabList = CollabService().getAllCollab();

