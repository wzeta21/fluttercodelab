import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/products_repository.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  final Category category;
  const HomePage({this.category: Category.all});
  // List<Card> _buildGridCards(BuildContext context) {
  //   List<Product> products = ProductsRepository.loadProducts(Category.all);
  //   if (products == null || products.isEmpty) {
  //     return const <Card>[];
  //   }

  //   final ThemeData theme = Theme.of(context);
  //   final NumberFormat formatter = NumberFormat.simpleCurrency(
  //       locale: Localizations.localeOf(context).toString());

  //   return products.map((product) {
  //     return Card(
  //       clipBehavior: Clip.antiAlias,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           AspectRatio(
  //             aspectRatio: 18 / 11,
  //             child: Image.asset(product.assetName,
  //                 package: product.assetPackage, fit: BoxFit.fitWidth),
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: <Widget>[
  //                   Text(
  //                     product == null ? '' : product.name,
  //                     style: theme.textTheme.button,
  //                     softWrap: false,
  //                     overflow: TextOverflow.ellipsis,
  //                     maxLines: 1,
  //                   ),
  //                   SizedBox(
  //                     height: 4.0,
  //                   ),
  //                   Text(
  //                     product == null ? '' : formatter.format(product.price),
  //                     style: theme.textTheme.caption,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //       elevation: 8.0,
  //     );
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     // brightness: Brightness.light,
    //     brightness: Brightness.dark,
    //     leading: IconButton(
    //       icon: Icon(Icons.menu),
    //       onPressed: () {
    //         print('menu button');
    //       },
    //     ),
    //     title: Text('SHRINE'),
    //     actions: <Widget>[
    //       IconButton(
    //         icon: Icon(Icons.search),
    //         onPressed: () {
    //           print('Search button');
    //         },
    //       ),
    //       IconButton(
    //         icon: Icon(Icons.tune),
    //         onPressed: () {
    //           print('Filter button');
    //         },
    //       )
    //     ],
    //   ),
    //   body: AsymmetricView(
    //     products: ProductsRepository.loadProducts(Category.all),
    //   ),
    // );
    return AsymmetricView(products: ProductsRepository.loadProducts(category));
  }
}
