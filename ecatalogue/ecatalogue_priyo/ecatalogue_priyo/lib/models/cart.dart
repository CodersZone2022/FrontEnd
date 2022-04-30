import 'package:ecatalogue_priyo/core/store.dart';
import 'package:ecatalogue_priyo/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';

class CartModel {
  //catalog fields
  CatalogModel? _catalog;

  //collection of IDs Store Ids of each items
  final List<int> _itemIDs = [];

//Get Catalog
  CatalogModel get catalog => catalog;
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List get items => _itemIDs.map((id) => catalog.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  set Catalog(CatalogModel Catalog) {}
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIDs.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIDs.remove(item.id);
  }
}
