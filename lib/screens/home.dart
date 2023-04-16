import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:osar_pasar/controller/home_controller.dart';
import 'package:osar_pasar/controller/notification_controller.dart';
import 'package:osar_pasar/screens/active_booking.dart';
import 'package:osar_pasar/screens/notification_page.dart';
import 'package:osar_pasar/screens/request.dart';
import 'package:osar_pasar/screens/service_providers.dart';
import 'package:osar_pasar/utils/colors.dart';
import 'package:osar_pasar/widgets/drawer.dart';

import '../controller/core_controller.dart';
import '../widgets/home_card.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home/page';
  HomePage({super.key});
  final c = Get.put(HomeController());

  final coreController = Get.find<CoreController>();
  final notificationCOntroller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    var hour = DateTime.now().hour;
    String greeting;
    if (hour <= 12) {
      greeting = ('Good Morning');
    } else if ((hour > 12) && (hour <= 16)) {
      greeting = ('Good Afternoon');
    } else if ((hour > 16) && (hour < 20)) {
      greeting = ('Good Evening');
    } else {
      greeting = ('Good Night');
    }

    var textTheme = Theme.of(Get.context!).textTheme;
    var theme = Theme.of(Get.context!);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xff00183F),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shadowColor: const Color.fromARGB(255, 243, 243, 243),
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () {
              notificationCOntroller.getAllNotifications();
              Get.to(NotificationPage(
                notificationMessage: 'You received a new notification',
              ));
            },
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Text(
                      greeting,
                      style: textTheme.titleMedium!.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      ", ${coreController.currentUser!.name?.capitalize}",
                      style: textTheme.titleMedium!.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeCard(
                    text: "Home Move",
                    iconData: Icons.home_filled,
                    onTap: (() => Get.to(() => ServiceProviderScreen())),
                  ),
                  HomeCard(
                    text: "Office Move",
                    iconData: Icons.label_important_rounded,
                    onTap: (() => Get.to(() => ServiceProviderScreen())),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFFC533),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop),
                    fit: BoxFit.fitWidth,
                    image: const NetworkImage(
                        "https://www.thepackersmovers.com/images/packers-movers-charges-banner.jpg",
                        scale: 2),
                  ),
                ),
                height: 180,
                width: double.infinity,
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10.0,
                    children: [
                      Text(
                        "Enjoy 10% off as a first mover",
                        style: textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            color: AppColors.whiteTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const Icon(
                        // Icons.directions_car_filled,
                        // Icons.delivery_dining,
                        FontAwesomeIcons.percent,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeCard(
                    text: "Requests",
                    iconData: Icons.history,
                    onTap: (() => Get.to(() => RequestScreen())),
                    // onTap: () {},
                  ),
                  HomeCard(
                    text: "Active Booking",
                    iconData: FontAwesomeIcons.receipt,
                    onTap: (() => Get.to(() =>  ActiveBookingScreen())),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop),
                    fit: BoxFit.cover,
                    image: const NetworkImage(
                      "http://blog.quikr.com/wp-content/uploads/2016/06/hire-movers-and-packers.png",
                    ),
                  ),
                ),
                height: 180,
                width: double.infinity,
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10.0,
                    children: [
                      Text(
                        "Scratchless Shifting",
                        style: textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            color: AppColors.whiteTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const Icon(
                        FontAwesomeIcons.peopleCarryBox,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
