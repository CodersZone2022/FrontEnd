import 'package:ecatalogue_priyo/models/catalog.dart';
import 'package:ecatalogue_priyo/widgets/home_widgets/add_to_cart.dart';
import 'package:ecatalogue_priyo/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item Catalog;

  const HomeDetailPage({Key? key, required this.Catalog})
      : assert(Catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.amberAccent,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${Catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(
              catalog: Catalog,
            ).wh(120, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(Catalog.id.toString()),
              child: Image.network(Catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.amberAccent,
                width: context.screenWidth,
                child: Column(
                  children: [
                    Catalog.name.text.xl4.color(MyTheme.BlueGrey).bold.make(),
                    Catalog.desc.text.xl.make(),
                    10.heightBox,
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
