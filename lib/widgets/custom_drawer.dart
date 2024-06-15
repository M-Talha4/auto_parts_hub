import 'package:flutter/material.dart';
import '../consts/app_color.dart';
import 'custom_text.dart';

// class Cdrawer extends StatelessWidget {
//   const Cdrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey<ScaffoldState>();

//     return SafeArea(
//       child: Scaffold(
//         key: scaffoldKey1,
//         // appBar: AppBar(),
//         drawer: const DrawerPage(),
//         body: Center(
//           child: ElevatedButton(
//               onPressed: () {
//                 scaffoldKey1.currentState?.openDrawer();
//               },
//               child: const Text("Open Drawer")),
//         ),
//       ),
//     );
//   }
// }

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: width * 0.75,
        height: height,
        color: AppColor.white,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.24,
              child: Stack(
                children: [
                  Container(
                    height: height * 0.2,
                    decoration: const BoxDecoration(
                        color: AppColor.primary,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/6f/74/5d/6f745ddbbbfd280e688589cebd4dd198.jpg"),
                            // image: AssetImage("images/profileBg.png"),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: AppColor.primary,
                            child: Icon(
                              Icons.close,
                              color: AppColor.grey,
                              size: width * 0.045,
                            ),
                          ))),
                  Positioned(
                    bottom: height * 0.015,
                    left: 15,
                    child: Container(
                      width: width * 0.165,
                      height: width * 0.165,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.2),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/cc/88/d4/cc88d47a11711348099dd0454fc4fad8.jpg"),
                            // image: AssetImage("images/user.png"),
                            // fit: BoxFit.fill
                          )),
                    ),
                  ),
                  Positioned(
                      bottom: height * 0.055,
                      left: width * 0.22,
                      child: CustomText(
                        text: "USER NAME",
                        color: AppColor.white,
                        fontSize: width * 0.038,
                      ))
                ],
              ),
            ),
            ListTile(
              title: CustomText(
                text: "Item 1",
                fontSize: width * 0.038,
              ),
              leading: const Icon(Icons.list),

              // Container(
              //     width: width * 0.05,
              //     decoration: const BoxDecoration(
              //         image: DecorationImage(
              //             image: AssetImage("images/home_drawer.png")))),

              minLeadingWidth: 4,
              onTap: () {},
            ),
            ListTile(
              title: CustomText(
                text: "Item 2",
                fontSize: width * 0.038,
              ),
              leading: const Icon(Icons.list),
              minLeadingWidth: 4,
              onTap: () {},
            ),
            ListTile(
              title: CustomText(
                text: "Item 3",
                fontSize: width * 0.038,
              ),
              leading: const Icon(Icons.list),
              minLeadingWidth: 4,
              onTap: () {},
            ),
            ListTile(
              title: CustomText(
                text: "Item 4",
                fontSize: width * 0.038,
              ),
              leading: const Icon(Icons.list),
              minLeadingWidth: 4,
              onTap: () {},
            ),
            ListTile(
              title: CustomText(
                text: "Item 5",
                fontSize: width * 0.038,
              ),
              leading: const Icon(Icons.list),
              minLeadingWidth: 4,
              onTap: () {},
            ),
            ListTile(
              title: CustomText(
                text: "Item 6",
                fontSize: width * 0.038,
              ),
              leading: const Icon(Icons.list),
              minLeadingWidth: 4,
              onTap: () {},
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                // firebaseAuth.signOut();
                // Get.offAllNamed(Routes.login);
              },
              child: ListTile(
                title: CustomText(
                  text: "Logout",
                  fontSize: width * 0.038,
                ),
                leading: const Icon(Icons.exit_to_app),
                minLeadingWidth: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
