

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/campaign_controller.dart';

class CampaignView extends StatelessWidget {
  const CampaignView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CampaignController());

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => Get.back(),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading under AppBar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Text(
                '캠페인 매칭',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            /// TabBar with full-width indicator
            Container(
              color: Colors.white,
              child: TabBar(
            controller: controller.tabController,
            indicatorColor: const Color(0xFF6A1B9A),
            indicatorWeight: 2.5,
            labelColor: const Color(0xFF6A1B9A),
            unselectedLabelColor: Colors.black54,
            labelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 15.sp),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: '신청'),
              Tab(text: '진행중'),
              Tab(text: '완료'),
            ],
          ),
            ),

            /// Tab Views
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  _campaignList(controller.applications),
                  _campaignList(controller.inProgress),
                  _campaignList(controller.completed),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _campaignList(RxList<Campaign> campaigns) {
    return Obx(
          () => ListView.separated(
        padding: EdgeInsets.all(16.w),
        itemCount: campaigns.length,
        separatorBuilder: (_, __) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          var campaign = campaigns[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              //border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                /// Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    bottomLeft: Radius.circular(8.r),
                  ),
                  child: Image.asset(
                    campaign.imagePath,
                    width: 100.w,
                    height: 100.w,
                    fit: BoxFit.cover,
                  ),
                ),

                /// Text content
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title
                        Text(
                          campaign.title,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),

                        /// Description
                        Text(
                          campaign.description,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black54,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.h),

                        /// Tags
                        Wrap(
                          spacing: 6.w,
                          runSpacing: 4.h,
                          children: campaign.tags
                              .map(
                                (tag) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: const Color(0xFFF3E5F5),
                              ),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF6A1B9A),
                                ),
                              ),
                            ),
                          )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
