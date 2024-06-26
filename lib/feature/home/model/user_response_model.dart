import 'dart:convert';
import 'package:tutorial_app/feature/home/model/user_model.dart';
import 'package:tutorial_app/product/core/model/base_model.dart';

final class UsersResponseModel extends BaseModel {
  final List<UserModel>? users;
  final UserModel? user;
  final String? error;
  final int? statusCode;
  const UsersResponseModel({
    this.users,
    this.user,
    this.error,
    this.statusCode,
  });

  @override
  fromJson(dynamic json) {
    /// [dynamic] gelen veri önce jsonDecode ile decode edilir.
    final decodedData = jsonDecode(json);

    /// [decodedData] Map ise
    /// [user] parametresine [User] sınıfından bir nesne oluşturulur ve atanır.
    if (decodedData is Map<String, dynamic>) {
      return UsersResponseModel(
        users: (decodedData['users'] as List<dynamic>?)
            ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
            .cast<UserModel>()
            .toList(),
      );
    }

    /// [decodedData] List ise
    /// içerisinde [User] sınıfı nesneleri barındıran bir liste oluşturulur.
    /// [decodedData] önce map'e çevrilir, map içerisindeki her bir eleman
    /// (e) ile temsil edilir ve [User] sınıfından bir nesne oluşturulur.
    /// Oluşturulan nesneler, [cast] methodu ile Liste içerisinde ki elemanların tipi
    /// [User] olarak kontrol eder, eğer tip hatalı gelirse [cast] hata döndürür.
    return UsersResponseModel(
      users: (decodedData as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .cast<UserModel>()
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final users = this.users?.map((user) => user.toJson()).toList();
    return {
      'users': users,
    };
  }

  @override
  List<Object?> get props => [users, user, error, statusCode];
}
