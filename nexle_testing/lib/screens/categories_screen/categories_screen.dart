import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexle_testing/constants/colors.dart';
import 'package:nexle_testing/models/category.dart';
import 'package:nexle_testing/screens/categories_screen/categories_controller.dart';
import 'package:nexle_testing/screens/categories_screen/components/categories_appbar.dart';
import 'package:nexle_testing/screens/categories_screen/components/categories_silver_header.dart';
import 'package:nexle_testing/services/size_config.dart';
import 'package:nexle_testing/utils/common_components.dart';

class CategoriesScreen extends GetView<CategoriesController> {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CommonComp.createAppBar(
          actions: <Widget>[_buildDone()],
          flexibleSpace: controller.canImageAppBar.value
              ? const FlexibleSpaceBar(
                  background: CategoriesAppBar(),
                )
              : null,
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.onPullToRefresh();
            },
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: <Widget>[
                _buildHeader(),
                _buildCategories(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDone() {
    final bool selected = controller.categories.value
            .firstWhereOrNull((TCategory e) => e.isSelected) !=
        null;
    return GestureDetector(
      onTap: () async {
        if (selected) {
          await controller.saveCategoriesInLocal();
          // Get.off(page);
        }
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: Center(
          child: CommonComp.setRegularText(
            txt: 'Done',
            fontSize: 14,
            color: Colors.white.withOpacity(selected ? 1.0 : 0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SliverPersistentHeader(
      delegate: CategoriesSliverHeader(
        expandedHeight: getProportionateScreenHeight(275),
      ),
      pinned: true,
    );
  }

  Widget _buildCategories() {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: SizeConfig.bottomPadding > 0 ? SizeConfig.bottomPadding : 20,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: getProportionateScreenWidth(8),
          crossAxisSpacing: getProportionateScreenWidth(8),
          childAspectRatio: 108 / 71,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: controller.categories.value.length,
          (BuildContext context, int index) {
            return _buildCategoryItem(controller.categories.value[index]);
          },
        ),
      ),
    );
  }

  Widget _buildCategoryItem(TCategory category) {
    return GestureDetector(
      onTap: () {
        controller.selectedCategory(category);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: getProportionateScreenWidth(71),
        width: getProportionateScreenWidth(108),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: category.isSelected
              ? const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: <Color>[
                    AppColor.pleasantPurple,
                    AppColor.purpleClimax,
                  ],
                )
              : null,
          border: Border.all(
            color: Colors.white.withOpacity(0.12),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: CommonComp.setRegularText(
            txt: category.name,
            color: Colors.white.withOpacity(
              category.isSelected ? 1 : 0.85,
            ),
            maxLine: 2,
          ),
        ),
      ),
    );
  }
}
