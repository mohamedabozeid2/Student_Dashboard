import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/helper.dart';
import 'cached_image.dart';

class ProfileImageWidget extends StatelessWidget {
  final String photo;

  const ProfileImageWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: Helper.getMaxWidth() * 0.5,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: CachedImage(
        image: photo,
        fit: BoxFit.contain,
        circularColor: AppColors.secondaryColor,
        height: Helper.getMaxHeight() * 0.2,
        width: Helper.getMaxWidth() * 0.5,
      ),
    );
  }
}
