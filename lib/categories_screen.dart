import 'package:flutter/material.dart';

import 'components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            gridViewCategoryItem(img: 'assets/images/vendor_img/acer.png', name: 'Acer',context: context),
            gridViewCategoryItem(img: 'assets/images/vendor_img/asus.png', name: 'Asus',context: context),
            gridViewCategoryItem(img: 'assets/images/vendor_img/dell.png', name: 'Dell',context: context),
            gridViewCategoryItem(img: 'assets/images/vendor_img/hp.png', name: 'HP',context: context),
            gridViewCategoryItem(img: 'assets/images/vendor_img/lenovo.png', name: 'Lenovo',context: context),
            gridViewCategoryItem(img: 'assets/images/vendor_img/msi.png', name: 'MSI',context: context),





          ],

        ),
      ),
    );
  }
}
