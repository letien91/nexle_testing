import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexle_testing/constants/loading_state.dart';
import 'package:nexle_testing/constants/strings.dart';
import 'package:nexle_testing/models/category.dart';
import 'package:nexle_testing/routes/routes_name.dart';
import 'package:nexle_testing/services/api/api_respository.dart';
import 'package:nexle_testing/services/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesController extends GetxController {
  final ApiRepository _apiRepository = Get.find<ApiRepository>();
  final RxList<TCategory> categories = <TCategory>[].obs;

  final ScrollController scrollController = ScrollController();
  final Rx<bool> canImageAppBar = false.obs;

  final double headerHeight = getProportionateScreenHeight(275);

  Rx<LoadingState> loadingState = LoadingState.none.obs;

  @override
  void onInit() {
    super.onInit();
    loadingState.value = LoadingState.success;

    scrollController.addListener(() {
      final double pixels = scrollController.position.pixels;
      canImageAppBar.value =
          (pixels + kToolbarHeight + SizeConfig.statusBarHeight >
              getProportionateScreenHeight(275));
    });
  }

  @override
  void onClose() {
    scrollController.removeListener(() {});
    scrollController.dispose();

    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    _getCategories();
  }

  Future<void> onPullToRefresh() async {
    categories.clear();
    await _getCategories();
  }

  Future<void> _getCategories() async {
    loadingState.value = LoadingState.loading;
    final Response<dynamic> response = await _apiRepository.getCategories();

    final dynamic body = response.body;
    if (body is! List<dynamic>) {
      loadingState.value = LoadingState.failure;
      return;
    }
    loadingState.value = LoadingState.success;
    final List<TCategory> list = body
        .map((dynamic e) => TCategory.fromMap(e as Map<String, dynamic>))
        .toList();
    categories.value.addAll(list);
    categories.refresh();
  }

  void selectedCategory(TCategory c) {
    final List<TCategory> list = categories.value.map((TCategory e) {
      if (e.id == c.id) {
        return e.copyWith(isSelected: !e.isSelected);
      }
      return e;
    }).toList();
    categories.value.clear();
    categories.value.addAll(list);
    categories.refresh();
  }

  Future<void> saveCategoriesInLocalAndGotoHome() async {
    final List<TCategory> list =
        categories.value.where((TCategory e) => e.isSelected).toList();
    final List<Map<String, dynamic>> listMap =
        list.map((TCategory e) => e.toMap()).toList();
    if (listMap.isEmpty) {
      return;
    }
    final String encode = jsonEncode(listMap);
    final SharedPreferences preferences = Get.find<SharedPreferences>();
    await preferences.setString(kUserCategoriesKey, encode);

    Get.offNamed(RoutesName.home);
  }
}
