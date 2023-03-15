import 'package:flutter/material.dart';
import 'package:todo_list/utils/color_utils.dart';

class AvatarCommon extends StatelessWidget {
  AvatarCommon(
      {Key? key,
      required Widget avatar,
      Widget? icon,
      Function()? onTap,
      Function()? onTapIcon})
      : super(key: key) {
    _avatar = avatar;
    _icon = icon;
    _onTap = onTap;
    _onTapIcon = onTapIcon;
  }

  Widget? _icon;
  Function()? _onTap;
  Function()? _onTapIcon;

  late Widget _avatar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.primaryColor, width: 10),
              shape: BoxShape.circle,
            ),
            child: _avatar,
          ),
          _icon != null
              ? Positioned(
                  bottom: 15,
                  right: 15,
                  child: GestureDetector(
                    onTap: _onTapIcon,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorUtils.bgColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: ColorUtils.primaryColor, width: 2),
                      ),
                      padding: const EdgeInsets.all(4),
                      alignment: Alignment.center,
                      child: _icon,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
