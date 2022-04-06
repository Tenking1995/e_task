import '../../models/product_model.dart';
import '../providers/api_provider.dart';

class ProductsRepo {
  final ApiProvider apiProvider;
  ProductsRepo(this.apiProvider);

  Future<List<ProductModel>> getProducts(String page) => 
  apiProvider.getProductList(page);
}