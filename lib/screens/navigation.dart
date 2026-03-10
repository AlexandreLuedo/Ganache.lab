// Page principale contenant la navigationBar.
import 'package:flutter/material.dart';
import 'package:ganache_lab/screens/settings/settings_screen.dart';
import 'package:ganache_lab/widgets/create_fab.dart';
import 'screens_exportation_file.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Scaffold(
          body: Row(
            children: [
              if (!sizingInformation.isMobile)
                Stack(
                  children: [
                    NavigationRail(
                      indicatorColor: const Color(0xFFEB8C36),
                      backgroundColor:
                          Theme.of(context).colorScheme.surfaceContainer,
                      extended: sizingInformation.isTablet ? false : true,
                      // labelType: NavigationRailLabelType.all,
                      labelType:
                          sizingInformation.isTablet
                              ? NavigationRailLabelType.selected
                              : NavigationRailLabelType.none,
                      selectedIndex: currentPageIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      leading:
                      // sizingInformation.isDesktop
                      //     ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          sizingInformation.isTablet
                              ? CreateSmallFab()
                              : CreateFlatFab(),
                          SizedBox(height: 20),
                        ],
                      ),
                      // : null, // See issue #23
                      destinations: const [
                        NavigationRailDestination(
                          icon: Icon(Symbols.home),
                          selectedIcon: Icon(
                            Symbols.home,
                            fill: 1,
                            color: Colors.white,
                          ),
                          label: Text('Accueil'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.menu_book),
                          selectedIcon: Icon(
                            Symbols.menu_book,
                            fill: 1,
                            color: Colors.white,
                          ),
                          label: Text('Recettes'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Symbols.settings),
                          selectedIcon: Icon(
                            Symbols.settings,
                            fill: 1,
                            color: Colors.white,
                          ),
                          label: Text('Paramètres'),
                        ),
                      ],
                    ),
                  ],
                ),
              Expanded(
                child:
                    <Widget>[
                      WelcomeScreen(),
                      RecipeList(),
                      SettingScreen(),
                    ][currentPageIndex],
              ),
            ],
          ),
          bottomNavigationBar:
              sizingInformation.isMobile
                  ? NavigationBar(
                    labelBehavior: labelBehavior,
                    onDestinationSelected: (int index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                    indicatorColor: const Color(0xFFEB8C36),
                    selectedIndex: currentPageIndex,
                    destinations: const <Widget>[
                      NavigationDestination(
                        selectedIcon: Icon(
                          Symbols.home,
                          fill: 1, // Why this big boy doesn't get filled
                          color: Colors.white,
                        ),
                        icon: Icon(Symbols.home),
                        label: 'Accueil',
                      ),
                      NavigationDestination(
                        selectedIcon: Icon(
                          Symbols.menu_book,
                          fill: 1,
                          // Icons.collections_bookmark,
                          color: Colors.white,
                        ),
                        icon: Icon(Icons.menu_book),
                        label: 'Recettes',
                      ),
                      NavigationDestination(
                        selectedIcon: Icon(
                          Symbols.settings,
                          fill: 1,
                          color: Colors.white,
                        ),
                        icon: Icon(Symbols.settings),
                        label: 'Paramètres',
                      ),
                    ],
                  )
                  : null,
        );
      },
    );
  }
}
