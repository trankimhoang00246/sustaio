// Example user data
import 'package:gdsc_2024/model/category.dart';
import 'package:gdsc_2024/model/collab_form.dart';
import 'package:gdsc_2024/model/user.dart';

List<User> userList = [
  User(
    id: 1,
    username: 'user1',
    name: 'John Doe',
    avatarUrl:
        'https://vinafood2.com.vn/wp-content/uploads/2002b079838543db1a94.jpg',
    role: 'Developer',
    categoryAccount: 'Doanh Nghiệp',
  ),
  User(
    id: 2,
    username: 'user2',
    name: 'Jane Doe',
    avatarUrl:
        'https://vinafood2.com.vn/wp-content/uploads/2002b079838543db1a94.jpg',
    role: 'Designer',
    categoryAccount: 'Doanh Nghiệp',
  ),
  // Add more user data as needed
];

// Example category data
List<Category> categoryList = [
  Category(id: 1, name: 'Gạo, hạt điều, cafe, đậu'),
  // Add more category data as needed
];

// Example collab data
List<Collab> collabList = [
  Collab(
    id: 1,
    content: 'Công ty lương thực miền Nam Việt Nam',
    otherContent: 'Additional content 1',
    descEnterprise: 'Description of the enterprise 1',
    address: 'Nghi Phú - Tp. Vinh - Nghệ An',
    verified: true,
    coverImageUrl: 'https://example.com/cover1.jpg',
    categoryDto: categoryList[0],
    userDto: userList[0],
  ),
  Collab(
    id: 2,
    content: 'Collaboration content 2',
    otherContent: 'Additional content 2',
    descEnterprise: 'Description of the enterprise 2',
    address: 'Enterprise address 2',
    verified: true,
    coverImageUrl: 'https://example.com/cover2.jpg',
    categoryDto: categoryList[0],
    userDto: userList[1],
  ),
  // Add more collab data as needed
];
