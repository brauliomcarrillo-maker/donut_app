import 'package:donut_app/tab/burger_tab.dart';
import 'package:donut_app/tab/donut_tab.dart';
import 'package:donut_app/tab/pancake_tab.dart';
import 'package:donut_app/tab/pizza_tab.dart';
import 'package:donut_app/tab/smoothie_tab.dart';
import 'package:donut_app/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TabController _tabController;
  List<Widget> myTabs = [
    //donut tab
    const MyTab(iconPath: 'lib/icons/donut.png', iconName: 'Donut'),
    //burger tab
    const MyTab(iconPath: 'lib/icons/burger.png', iconName: 'Burger'),
    //smoothie tab
    const MyTab(iconPath: 'lib/icons/smoothie.png', iconName: 'Smoothie'),
    //pancake tab
    const MyTab(iconPath: 'lib/icons/pancakes.png', iconName: 'Pancake'),
    //pizza tab
    const MyTab(iconPath: 'lib/icons/pizza.png', iconName: 'Pizza'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // Icono de la izquierda
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          // Iconos de la derecha
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, color: Colors.grey[800]),
            ),
          ],
        ),
        body: Column(
          //1. Texo principal
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text('I want to ', style: TextStyle(fontSize: 24)),
                  Text(
                    'Eat',
                    style: TextStyle(
                      //Tamaño de la letra
                      fontSize: 24,
                      //Negritas
                      fontWeight: FontWeight.bold,
                      //Subrayado
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            //2. Pestañas (TabBar)
            TabBar(tabs: myTabs),

            Expanded(
              child: TabBarView(
                //controller: _tabController,
                children: [
                  DonutTab(),
                  BurguerTab(),
                  SmoothieTab(),
                  PancakeTab(),
                  PizzaTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
