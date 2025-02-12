import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yanmii_wallet/src/common/data/repositories/example_repository.dart';
import 'package:yanmii_wallet/src/common/data/sources/remote/config/network_result.dart';
import 'package:yanmii_wallet/src/common/domain/entities/item.dart';

class MainService {
  MainService(this.exampleRepository);

  final ExampleRepository exampleRepository;

  Future<NetworkResult<List<Item>>> fetchItems() async =>
      exampleRepository.fetchItems();
}

final mainServiceProvider = Provider<MainService>(
  (ref) => MainService(ref.read(exampleRepositoryProvider)),
);
