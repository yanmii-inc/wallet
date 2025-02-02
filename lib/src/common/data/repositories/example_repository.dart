import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/mappers/item_mapper.dart';
import 'package:yanmii_wallet/src/common/data/models/responses/item_response.dart';
import 'package:yanmii_wallet/src/common/data/sources/remote/api/example_api.dart';
import 'package:yanmii_wallet/src/common/data/sources/remote/config/config.dart';
import 'package:yanmii_wallet/src/common/domain/entities/item.dart';

class ExampleRepository {
  ExampleRepository(this.exampleApi);
  final ExampleApi exampleApi;

  /// This just mocks the fetch request from REST API
  Future<Result<List<Item>>> fetchItems() async {
    try {
      final response = await exampleApi.getItems();

      final list = ItemMapper.mapItemListRespoToItemList(response!.items);

      return Result.success(list);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getException(e, st),
        st,
      );
    }
  }

  /// This just mocks the fetch request from REST API
  Future<Result<ItemResponse?>> getDetail(String id) async {
    try {
      final response = await exampleApi.getDetail(id);
      return Result.success(response);
    } catch (e, st) {
      return Result.failure(
        NetworkExceptions.getException(e, st),
        st,
      );
    }
  }
}

final exampleRepositoryProvider =
    Provider((ref) => ExampleRepository(ref.watch(exampleApiProvider)));
