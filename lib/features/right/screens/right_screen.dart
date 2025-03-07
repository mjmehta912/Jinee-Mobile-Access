import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/constants/color_constants.dart';
import 'package:jinee_mobile_access/styles/textstyles.dart';
import 'package:jinee_mobile_access/widgets/app_appbar.dart';
import 'package:jinee_mobile_access/widgets/app_paddings.dart';
import 'package:jinee_mobile_access/features/right/controllers/right_controller.dart';

class RightScreen extends StatefulWidget {
  const RightScreen({
    super.key,
    required this.userId,
    required this.userName,
  });

  final int userId;
  final String userName;

  @override
  State<RightScreen> createState() => _RightScreenState();
}

class _RightScreenState extends State<RightScreen> {
  final RightController _controller = Get.put(
    RightController(),
  );

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    await _controller.fetchUserAccess(
      userId: widget.userId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: widget.userName,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Obx(
          () {
            if (_controller.menuAccess.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kColorUserRight,
                ),
              );
            }

            return ListView.builder(
              itemCount: _controller.menuAccess.length,
              itemBuilder: (context, index) {
                final menu = _controller.menuAccess[index];

                return ListTile(
                  contentPadding: AppPaddings.p10,
                  title: Text(
                    menu.menuName,
                    style: TextStyles.kSemiBoldMontserrat(
                      fontSize: FontSize.k24FontSize,
                      color: kColorUserRight,
                    ).copyWith(
                      height: 1.5,
                    ),
                  ),
                  trailing: Switch(
                    activeColor: kColorTextSecondary,
                    activeTrackColor: kColorUserRight,
                    inactiveTrackColor: Colors.transparent,
                    inactiveThumbColor: kColorSecondary,
                    value: menu.access,
                    onChanged: (bool value) {
                      _controller.updateMenuAccess(
                        userId: widget.userId,
                        menuId: menu.menuId,
                        newAccess: value,
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
