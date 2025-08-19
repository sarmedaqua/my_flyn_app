import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Campaign {
  String title;
  String description;
  String imagePath;
  List<String> tags;

  Campaign({required this.title, required this.description, required this.imagePath, required this.tags});
}

class CampaignController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxList<Campaign> applications = <Campaign>[].obs;
  RxList<Campaign> inProgress = <Campaign>[].obs;
  RxList<Campaign> completed = <Campaign>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    // Dummy data
    applications.addAll([
      Campaign(
        title: '회사명 나오는 자리',
        description: '소개명 나오는 자리입니다.한줄만 나옵니다...',
        imagePath: 'assets/images/sea.png',
        tags: ['F&B', '패션', '웨딩/레터링'],
      ),
      Campaign(
        title: '회사명 나오는 자리',
        description: '소개명 나오는 자리입니다.한줄만 나옵니다...',
        imagePath: 'assets/images/people.png',
        tags: ['F&B', '패션', '웨딩/레터링'],
      ),
      Campaign(
        title: '회사명 나오는 자리',
        description: '소개명 나오는 자리입니다.한줄만 나옵니다...',
        imagePath: 'assets/images/night.png',
        tags: ['F&B', '패션', '웨딩/레터링'],
      ),
      Campaign(
        title: '회사명 나오는 자리',
        description: '소개명 나오는 자리입니다.한줄만 나옵니다...',
        imagePath: 'assets/images/food.png',
        tags: ['F&B', '패션', '웨딩/레터링'],
      ),
      Campaign(
        title: '회사명 나오는 자리',
        description: '소개명 나오는 자리입니다.한줄만 나옵니다...',
        imagePath: 'assets/images/food2.png',
        tags: ['F&B', '패션', '웨딩/레터링'],
      ),

    ]);



    inProgress.addAll([
      Campaign(
        title: '회사명 나오는 자리',
        description: '소개명 나오는 자리입니다.한줄만 나옵니다...',
        imagePath: 'assets/images/sea.png',
        tags: ['F&B', '패션', '웨딩/레터링'],
      ),
      Campaign(
        title: '회사명 나오는 자리',
        description: '소개명 나오는 자리입니다.한줄만 나옵니다...',
        imagePath: 'assets/images/people.png',
        tags: ['F&B', '패션', '웨딩/레터링'],
      ),
      Campaign(
        title: '회사명 나오는 자리',
        description: '소개명 나오는 자리입니다.한줄만 나옵니다...',
        imagePath: 'assets/images/night.png',
        tags: ['F&B', '패션', '웨딩/레터링'],
      ),

    ]);

    completed.addAll([
      Campaign(
        title: '회사명 나오는 자리',
        description: '소개명 나오는 자리입니다.한줄만 나옵니다...',
        imagePath: 'assets/images/sea.png',
        tags: ['F&B', '패션', '웨딩/레터링'],
      ),
      Campaign(
        title: '회사명 나오는 자리',
        description: '소개명 나오는 자리입니다.한줄만 나옵니다...',
        imagePath: 'assets/images/people.png',
        tags: ['F&B', '패션', '웨딩/레터링'],)
    ]);


  }
}