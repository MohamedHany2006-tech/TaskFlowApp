import 'package:flutter/material.dart';
import 'package:to_do_list/Feature/Home/Presentation/view/tabs/Calendar_tab.dart';
import 'package:to_do_list/Feature/Home/Presentation/view/tabs/History_tab.dart';
import 'package:to_do_list/Feature/Home/Presentation/view/tabs/Home_tab.dart';
import 'package:to_do_list/Feature/Home/Presentation/view/tabs/Profile_tab.dart'
    show ProfileTab;
import 'package:to_do_list/core/Share/Functions/show_task_form.dart';
import 'package:to_do_list/core/Share/widgets/NavigationBottun.dart';
import 'package:to_do_list/core/Share/widgets/custome_app_bar.dart';
import 'package:to_do_list/core/Utilis/constans.dart';
import 'package:to_do_list/core/Utilis/unints.dart';
import 'package:to_do_list/core/style/AssetsManager.dart';
import 'package:to_do_list/core/style/ColorManager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  int selectedIndex = 0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Constans.getAppBarSize(context),
        child: CustomeAppBar(),
      ),
      body: PageView(
        onPageChanged: (index) => {
          setState(() {
            selectedIndex = index;
          }),
        },
        children: _buildBody(),
        controller: _pageController,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.BrandButton,
        shape: CircleBorder(),
        isExtended: true,
        elevation: Units.getWidth(context: context, value: 5),
        child: Image.asset(AssetsManager.AddIcon),
        onPressed: () async {
          await ShowTaskSheet(context);
        },
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
            _pageController.animateToPage(
              selectedIndex,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          });
        },
      ),
    );
  }

  List<Widget> _buildBody() => [
    HomeTab(),
    CalendarTab(),
    ProfileTab(),
    HistoryTab(),
  ];
}
