import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jinee_mobile_access/widgets/custom_text.dart';
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
      appBar: AppBar(
        title: CustomText(
          title: widget.userName,
          fontSize: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Obx(
          () {
            // Check if the menuAccess data has been loaded
            if (_controller.menuAccess.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: _controller.menuAccess.length,
              itemBuilder: (context, index) {
                final menu = _controller.menuAccess[index];

                return ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  // title: CustomText(
                  //   title: menu.menuName,
                  //   fontSize: 40,
                  // ),
                  title: Text(
                    menu.menuName,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF00BFFF),
                      height: 1,
                    ),
                  ),
                  trailing: Switch(
                    activeColor: const Color(0xFF00BFFF),
                    activeTrackColor: const Color(0xFFFFFF00),
                    inactiveTrackColor: Colors.transparent,
                    inactiveThumbColor: const Color(0xFF00BFFF),
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
