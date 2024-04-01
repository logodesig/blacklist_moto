import 'package:blacklist_moto/app/modules/home/controllers/home_controller.dart';
import 'package:blacklist_moto/app/routes/app_pages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
            children: const [
              HomeView(),
              // Center(child: ValidCard()),
              BlackProfilView()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.home),
                label: 'Home',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(LucideIcons.search),
              //   label: 'Search',
              // ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.app),
                label: 'Options',
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

class InvalidCard extends StatelessWidget {
  const InvalidCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
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
                Get.toNamed(Routes.REPPORT_MOTO);
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                controller.changeFindMotoState(MotoState.initial);
              },
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
      );
    });
  }
}

class ValidCard extends StatelessWidget {
  const ValidCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
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
            CardItem(
                title: "Nom",
                value:
                    "${controller.motoInfo["firstName"]} ${controller.motoInfo["lastName"]}"),
            CardItem(
                title: "N° de plaque",
                value: "${controller.motoInfo["uniqueId"]}"),
            CardItem(title: "ville", value: "${controller.motoInfo["ville"]}"),
            CardItem(
                title: "Mairie", value: "${controller.motoInfo["mairie"]}"),
            const CardItem(title: "Status", value: "Active"),
            const Spacer(),
            TextButton(
                onPressed: () {
                  controller.changeFindMotoState(MotoState.initial);
                },
                child: const Text(
                  'Fermer ',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                  ),
                ))
          ]));
    });
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Expanded(
            child: GetBuilder<HomeController>(builder: (controller) {
              switch (controller.findMotoState) {
                case MotoState.initial:
                  return const InitalView();
                case MotoState.loading:
                  return const LoadingView();
                case MotoState.loaded:
                  return const Center(child: ValidCard());
                case MotoState.error:
                  return const Center(child: InvalidCard());

                default:
                  return const InitalView();
              }
            }),
          ),
          CarouselSlider(
              items: [
                Container(
                  // height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color.fromARGB(255, 163, 163, 163)),
                      color: const Color.fromARGB(255, 253, 251, 232)),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/images/sslogo.jpeg",
                            width: 50, height: 50, fit: BoxFit.cover),
                        const SizedBox(width: 10),
                        const Text("SOS HOME",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w800))
                      ],
                    ),
                  ),
                ),
                Container(
                    // height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: const Color.fromARGB(255, 163, 163, 163)),
                        color: const Color.fromARGB(255, 253, 251, 232)),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/images/logocamerounbon.png",
                              width: 50, height: 50, fit: BoxFit.cover),
                          const SizedBox(width: 10),
                          const Text(
                            "MINAT",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    )),
              ],
              options: CarouselOptions(
                height: 80,
              ))
        ],
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.yellow,
      ),
    );
  }
}

class InitalView extends StatelessWidget {
  const InitalView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
        children: [
          const Spacer(),
          Image.asset(
            "assets/images/NI_20130705105813.jpg",
            width: double.infinity,
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.yellow),
                child: child,
              );
            },
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            // margin: const EdgeInsets.all(12),
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
              onChanged: (motoId) {
                controller.findMotoId = motoId;
              },
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
            onTap: () {
              // controller.findMotoState = MotoState.loaded;
              controller.findMoto();

              controller.update();
            },
          ),
          const Spacer(),
        ],
      );
    });
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

class BlackProfilView extends StatelessWidget {
  const BlackProfilView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 26),
              const Text(
                "Parametre",
                style: TextStyle(
                  fontFamily: "Satoshi",
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff202020),
                  // height: 15 / 20,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 26),
              ProfilItem(
                icon: LucideIcons.bike,
                title: "Motos",
                onTap: () {
                  // controller.player.stop();
                  Get.toNamed(Routes.MOTOS);
                },
              ),

              ProfilItem(
                icon: CupertinoIcons.person,
                title: "Profil",
                onTap: () {
                  // controller.player.stop();
                  Get.toNamed(Routes.EDIT_PROFI);
                },
              ),

              // ProfilItem(
              //   icon: CupertinoIcons.app_badge,
              //   title: "Apprendre une nouvelle langue",
              //   onTap: () {
              //     Get.toNamed(Routes.NEW_LANGUAGE);
              //   },
              // ),
              ProfilItem(
                icon: CupertinoIcons.chat_bubble_2,
                title: "Laisser un avis",
                onTap: () {
                  // controller.player.stop();
                  Get.toNamed(Routes.FEEDBACK);
                },
              ),
              ProfilItem(
                icon: CupertinoIcons.settings,
                title: "Paramètres",
                hidenBar: true,
                onTap: () {
                  // controller.player.stop();
                  Get.toNamed(Routes.PARAMETRES);
                },
              ),
              const SizedBox(height: 30),
              ProfilItem(
                icon: CupertinoIcons.restart,
                title: "Historique",
                onTap: () {
                  // controller.player.stop();
                  Get.toNamed(Routes.HISTORIQUES);
                },
              ),
              ProfilItem(
                icon: CupertinoIcons.chat_bubble_2,
                title: "Conditions d'utilisation",
                onTap: () {
                  // controller.player.stop();
                  Get.toNamed(Routes.TERMS_CONDITIONS);
                },
              ),
              const SizedBox(height: 30),
              ProfilItem(
                icon: CupertinoIcons.book,
                title: "Appropos de l'application",
                onTap: () {
                  // controller.player.stop();
                  Get.toNamed(Routes.APROPOS);
                },
              ),
              ProfilItem(
                icon: CupertinoIcons.power,
                title: "Deconnexion",
                hidenBar: true,
                onTap: () {
                  // controller.authServices.signOut();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProfilItem extends StatelessWidget {
  const ProfilItem(
      {super.key,
      this.hidenBar = false,
      required this.title,
      required this.icon,
      this.onTap});
  final String title;
  final IconData icon;
  final void Function()? onTap;
  final bool hidenBar;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            border: !hidenBar
                ? const Border(
                    bottom: BorderSide(
                        width: 1, color: Color.fromARGB(255, 231, 227, 227)))
                : null,
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Expanded(
                child: Text(
              title,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff202020),
                // height: 11 / 16,
              ),
              textAlign: TextAlign.left,
            )),
            const SizedBox(width: 10),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
