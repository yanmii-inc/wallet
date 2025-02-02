import 'package:yanmii_wallet/src/common/data/models/responses/item_response.dart';
import 'package:yanmii_wallet/src/common/domain/entities/item.dart';

/// Mapper is a class responsible to map raw objects retrieved from the API
/// to models acccording to UI needs
class ItemMapper {
  const ItemMapper._();

  static List<Item> mapItemListRespoToItemList(List<ItemResponse> data) {
    return data
        .map(
          (e) => Item(
            id: e.id ?? 0,
            title: e.title ?? 'No title',
            description: e.description ?? 'No description',
            profileImg: e.images?.first ?? '',
            thumbnail: e.thumbnail ?? '',
          ),
        )
        .toList();
  }
}
