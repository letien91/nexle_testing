import 'package:flutter/material.dart';
import 'package:nexle_testing/screens/categories_screen/components/categories_background.dart';
import 'package:nexle_testing/services/size_config.dart';
import 'package:nexle_testing/utils/common_components.dart';

class CategoriesSliverHeader extends SliverPersistentHeaderDelegate {
  CategoriesSliverHeader({required this.expandedHeight});
  final double expandedHeight;

  final double _wellcomeHeader = getProportionateScreenHeight(83);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          top: -shrinkOffset,
          left: 0,
          right: 0,
          bottom: 0,
          child: const CategoriesBackground(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Opacity(
            opacity: (1 -
                (shrinkOffset / (expandedHeight - _wellcomeHeader))
                    .clamp(0, 1)),
            child: _buildWelcomeHeader(),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  Widget _buildWelcomeHeader() {
    return Container(
      height: _wellcomeHeader,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CommonComp.setRegularText(
            txt: 'Wellcome to Flutter Test',
            fontSize: 22,
          ),
          SizedBox(height: getProportionateScreenHeight(11)),
          CommonComp.setRegularText(
            txt: 'Please select categories what you would '
                'like to see on your feed. You can set '
                'this later on Filter.',
            maxLine: 3,
            color: Colors.white.withOpacity(0.83),
          ),
        ],
      ),
    );
  }
}
