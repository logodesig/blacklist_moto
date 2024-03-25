import 'package:blacklist_moto/app/modules/home/controllers/home_controller.dart';
import 'package:blacklist_moto/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Blacklist Moto'.toUpperCase(),
              style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 27,
                  fontWeight: FontWeight.w900),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Image.asset('assets/images/logo_app.png'),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.NOTIFICATIONS);
                },
                icon: const Icon(LucideIcons.bell),
              ),
              const SizedBox(
                width: 12,
              )
            ],
          ),
          body: IndexedStack(
            index: controller.selectedIndex,
            children: [
              HomeView(),
              Center(child: ValidCard()),
              Center(
                  child: Container(
                width: 338,
                height: 569,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(246, 6, 20, 0.3100000023841858),
                          offset: Offset(0, 4),
                          blurRadius: 10)
                    ],
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                        color: const Color.fromRGBO(246, 6, 20, 1), width: 2)),
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                        width: 130,
                        height: 145,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromRGBO(217, 217, 217, 1))),
                    const SizedBox(height: 20),
                    Text(
                      'INValide'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromRGBO(246, 6, 20, 1),
                        fontFamily: 'Inter',
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Le code de la moto que vous avez entré n\''
                      'a pas été trouvé dans notre base de données. Veuillez vérifier le code et réessayer.'
                      'Si vous êtes sûr que le code est correct, veuillez signaler',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    PrimaryBtn(
                      title: 'Signaler',
                      textColor: Colors.white,
                      backgroundColor: const Color.fromRGBO(246, 6, 20, 1),
                      onTap: () {
                        // Get.toNamed(Routes.REPORT);
                      },
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Reessayer',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: controller.selectedIndex,
            onTap: controller.onItemTapped,
          ),
        );
      }),
    );
  }
}

class ValidCard extends StatelessWidget {
  const ValidCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 338,
        height: 569,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(42, 204, 15, 0.3100000023841858),
                offset: Offset(0, 4),
                blurRadius: 16)
          ],
          color: const Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(
            color: const Color.fromRGBO(42, 204, 15, 1),
            width: 2,
          ),
        ),
        child: Column(children: [
          Container(
              width: 130,
              height: 145,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromRGBO(217, 217, 217, 1))),
          const SizedBox(height: 20),
          const Text(
            'Valide ',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(21, 152, 0, 1),
              fontFamily: 'Inter',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const CardItem(title: "Nom", value: "John Doe"),
          const CardItem(title: "Email", value: "johbdoe@gmail.com"),
          const CardItem(title: "Phone", value: "1234567890"),
          const CardItem(
              title: "Address", value: "123 Main Street, Anytown, CA 12345"),
          const CardItem(title: "Status", value: "Active"),
          const Spacer(),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Fermer ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                ),
              ))
        ]));
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    this.title,
    this.value,
  });
  final String? title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          '$title',
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )),
        Expanded(
            flex: 2,
            child: Text('$value',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                )))
      ],
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(12),
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(155, 255, 249, 199),
            border: Border.all(
                color: const Color.fromARGB(185, 150, 150, 150), width: 1),
          ),
          child: TextFormField(
            style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Inter',
              fontSize: 26,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 12, right: 12),
              hintText: 'Y5A...',
            ),
            cursorColor: const Color.fromARGB(185, 150, 150, 150),
          ),
        ),
        const SizedBox(height: 30),
        PrimaryBtn(
          title: "Recherche",
          onTap: () {},
        ),
        const Spacer(),
      ],
    );
  }
}

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    super.key,
    required this.title,
    required this.onTap,
    this.backgroundColor = const Color.fromRGBO(255, 190, 1, 1),
    this.textColor = const Color.fromRGBO(0, 0, 0, 1),
  });
  final String title;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(12),
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.151),
                offset: Offset(0, 2),
                blurRadius: 10)
          ],
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            '$title ',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: textColor,
              fontFamily: 'Inter',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
