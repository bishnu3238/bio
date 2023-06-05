import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/enums.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/app_bar.dart';
import 'package:universal_lab/package/navigate.dart';
import 'package:universal_lab/package/size_config.dart';

import '../items/items_by_type.dart';

class Brands extends StatelessWidget {
  const Brands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: "Brands"),
      body: Consumer<Provide>(
        builder: (context, provide, _) {
          var brands = provide.brands;
          return CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: brands.length,
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () {
                        //TODO:show brand items
                        Navigate.go(
                          context,
                          ItemsByType(
                            type: ItemSearchType.Brand,
                            id: brands[index].id,
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        shadowColor: Colors.purpleAccent.shade100,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Card(
                              elevation: 0,
                              child: SizedBox(
                                height: getProportionateScreenHeight(60),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    brands[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: FittedBox(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 10, 5, 12),
                                  child: Text(
                                    brands[index].name,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 15,
                ),

              )
            ],
          );
        },
      ),
    );
  }
}
