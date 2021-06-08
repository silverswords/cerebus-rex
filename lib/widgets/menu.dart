<<<<<<< HEAD
import 'package:cerebus_rex/config/theme.dart';
import 'package:cerebus_rex/widgets/menu_item.dart';
import 'package:flutter/material.dart';
=======
import 'package:cerebus_rex/model/menu.dart';
import 'package:flutter/material.dart';
import 'package:cerebus_rex/config/theme.dart';
import 'package:cerebus_rex/widgets/menu_item.dart';
import 'package:provider/provider.dart';
>>>>>>> 6108a1113374f9325dda4d95c638d481f944cb5c

class SideBarMenu extends StatefulWidget {
  // final Function changePages;
  SideBarMenu();

  @override
  _SideBarMenuState createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidgth = 70;
  
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    _animation = Tween<double>(begin: maxWidth, end: minWidgth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<MenuModel>().selectIndex;
    bool collapsed = context.watch<MenuModel>().collapsed;
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black26, spreadRadius: 2)
            ],
            color: drawerBgColor,
          ),
          width: _animation.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.nlark.com/yuque/0/2020/jpeg/anonymous/1594741657154-42e897b7-ed34-4dc7-835f-1525705d87d3.jpeg'),
                      fit: BoxFit.cover,
                    )),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI4JuatGP6M5_Q0wYSkx2jAVzJff1FBaPYXV7zFbMngh5RV6J7'),
                            backgroundColor: Colors.white,
                            radius: _animation.value >= 250 ? 30 : 20,
                          ),
                          SizedBox(
                            width: _animation.value >= 250 ? 20 : 0,
                          ),
                          (_animation.value >= 250)
                              ? Text('Yasin ilhan',
                                  style: menuListTileDefaultText)
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        height: _animation.value >= 250 ? 20 : 0,
                      ),
                      Spacer(),
                      (_animation.value >= 250)
                          ? Text(
                              'Yasin ilhan',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Container(),
                      (_animation.value >= 250)
                          ? Text(
                              'yasinilhan61@gmail.com',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, counter) {
                    return Divider(
                      height: 2,
                    );
                  },
                  itemCount: menuItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MenuItemTile(
                      menuItems[index].title,
                      menuItems[index].icon,
                      _animationController,
                      () {
                        setState(
                          () {
                            context.read<MenuModel>().select(index);
                          },
                        );
                      },
                      isSelected: selectedIndex == index,
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    context.read<MenuModel>().changeCollapsed();
                    collapsed
                        ? _animationController.reverse()
                        : _animationController.forward();
                  });
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}

class Menu {
  String title;
  IconData icon;

  Menu(this.title, this.icon);
}

List<Menu> menuItems = [
  Menu('所有任务', Icons.dashboard),
  Menu('创建任务', Icons.web),
  Menu('发布任务', Icons.insert_chart),
];
