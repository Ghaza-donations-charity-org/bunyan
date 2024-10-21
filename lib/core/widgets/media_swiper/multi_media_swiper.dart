
import 'package:flutter/material.dart';
import '../../../../core/app_constants/app_measures.dart';
import '../../../../core/theme/app_colors.dart';
import '../../theme/app_text_styles_and_theme/app_text_styles.dart';
import '../../utility_functions_and_classes/image_utils.dart';
import '../../utility_functions_and_classes/screen_utility_functions.dart';

class MediaSwiper extends StatefulWidget {
  final List<String> listOfMediaUrls;
  final String? title;
  const MediaSwiper({super.key, required this.listOfMediaUrls, this.title});

  @override
  State<MediaSwiper> createState() => _MediaSwiperState();
}

class _MediaSwiperState extends State<MediaSwiper> {
  List<Image> childWidgets = [];

  @override
  void initState() {
    super.initState();
    for (var imageUrl in widget.listOfMediaUrls) {
      if (imageUrl.isNotEmpty) {
        childWidgets.add(
          Image(
            image: ImageUtilityFunctions.getImage(imageUrl),
            fit: BoxFit.cover,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(AppMeasures.smallPadding6),
        child: SizedBox(
            height: 280,
            child: Column(
              children: [
                widget.title == null
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.title!,
                          style: AppTextStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.textPrimaryColor),
                        ),
                      ),
                const SizedBox(
                  height: AppMeasures.mediumSpacer12,
                ),
                Container(
                  height: 265,
                  width: ScreenUtilityFunctions().screenWidth,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(AppMeasures.mediumBorderRadius12),
                        topRight:
                            Radius.circular(AppMeasures.mediumBorderRadius12),
                      ),
                      color: AppColors.lightGreyGedan),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppMeasures.mediumBorderRadius12),
                      topRight: Radius.circular(AppMeasures.mediumBorderRadius12),
                    ),
                    child: PageIndicatorWidget(
                      pages: childWidgets,
                    ),
                  ),
                ),
              ],
            )));
  }
}

class PageIndicatorWidget extends StatefulWidget {
  final List<Widget> pages;

  const PageIndicatorWidget({super.key, required this.pages});

  @override
  _PageIndicatorWidgetState createState() => _PageIndicatorWidgetState();
}

class _PageIndicatorWidgetState extends State<PageIndicatorWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppMeasures.mediumBorderRadius12),
          topRight: Radius.circular(AppMeasures.mediumBorderRadius12),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 245,
            width: ScreenUtilityFunctions().screenWidth,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(AppMeasures.mediumBorderRadius12),
              ),
              child: PageView(
                controller: _pageController,
                children: widget.pages,
              ),
            ),
          ),
          Container(color: AppColors.white, height: AppMeasures.mediumSpacer12),
          Container(
            height: 8,
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.pages.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? AppColors.grey3DisabledColor
                        : AppColors.lightGrey2,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
