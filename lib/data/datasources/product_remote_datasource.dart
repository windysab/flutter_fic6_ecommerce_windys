

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

import '../../common/global_variables.dart';
import '../models/responses/list_product_response_model.dart';

class ProductRemoteDatasource {
  Future<Either<String, ListProductResponseModel>> getAllProduct() async {
    final response =
        await http.get(Uri.parse('${GlobalVariables.baseUrl}/api/products'));

    if (response.statusCode == 200) {
      return Right(ListProductResponseModel.fromRawJson(response.body));
    } else {
      return const Left('proses gagal');
    }
  }

  Future<Either<String, ListProductResponseModel>> search(String name) async {
    final response =
        await http.get(Uri.parse('${GlobalVariables.baseUrl}/api/products?filters[name][\$contains]=$name'));

    if (response.statusCode == 200) {
      return Right(ListProductResponseModel.fromRawJson(response.body));
    } else {
      return const Left('proses gagal');
    }
  }
}
