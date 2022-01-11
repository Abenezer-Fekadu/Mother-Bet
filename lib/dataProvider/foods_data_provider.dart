import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mother_bet/.env.dart';
import 'package:mother_bet/models/food.dart';
import 'package:mother_bet/outExeption.dart';

class FoodsDataProvider {
// Get all Tours
  Future<List<Food>> fetchTopFoods() async {
    final response = await http.get(Uri.parse("$url/foods"));
    if (response.statusCode == 200) {
      final foods = jsonDecode(response.body) as List;
      return foods.map((food) => Food.fromJson(food)).toList();
    } else {
      final err = jsonDecode(response.body);
      throw AppExc(err["msg"]);
    }
  }

// // Add a Reviews
//   Future<Review> addReview(Review review) async {
//     final http.Response response =
//         await http.post(Uri.parse("$url/features/reviews"),
//             headers: <String, String>{"Content-Type": "application/json"},
//             body: jsonEncode({
//               "UserId": review.userId,
//               "TourId": review.tourId,
//               "Comment": review.comment,
//               "Rate": review.rate,
//               "Date": review.date
//             }));
//     if (response.statusCode == 201) {
//       print(response.body);
//       return Review.fromJson(jsonDecode(response.body));
//     } else {
//       print("Error");
//       throw Exception("Failed to add your Review");
//     }
//   }

//   // GEt All Reviews
//   Future<List<Review>> fetchAllReviews(int tId) async {
//     final response = await http.get(Uri.parse("$url/features/reviews/$tId"));
//     if (response.statusCode == 200) {
//       final tours = jsonDecode(response.body) as List;
//       print(tours);
//       return tours.map((tour) => Review.fromJson(tour)).toList();
//     } else {
//       print("Error");
//       final err = jsonDecode(response.body);
//       throw AppExc(err["message"]);
//     }
//   }

// // Get Tour by Id
//   Future<Tour> getTour(int id, Tour tour) async {
//     final response = await http.get(Uri.parse("$url/tours/$id"));

//     if (response.statusCode == 200) {
//       return Tour.fromJson(jsonDecode(response.body));
//     } else {
//       final err = jsonDecode(response.body);
//       throw AppExc(err["message"]);
//     }
//   }

//   Future<User> bookStatus(int uId, int tId) async {
//     final response = await http.get(Uri.parse("$url/users/$uId/book/$tId"));

//     if (response.statusCode == 200) {
//       return User.fromJson(jsonDecode(response.body));
//     } else {
//       final err = jsonDecode(response.body);
//       throw AppExc(err["message"]);
//     }
//   }

//   // // Book a Tour
//   Future<User> book(int uId, int tourId) async {
//     final http.Response response =
//         await http.post(Uri.parse("$url/users/$uId/book"),
//             headers: <String, String>{"Content-Type": "application/json"},
//             body: jsonEncode({
//               "TourId": tourId,
//             }));
//     if (response.statusCode == 200) {
//       return User.fromJson(jsonDecode(response.body));
//     } else {
//       final err = jsonDecode(response.body);
//       print(err);
//       throw AppExc(err["message"]);
//     }
//   }
}
