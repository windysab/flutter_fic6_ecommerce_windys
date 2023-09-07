import 'package:flutter/material.dart';

import '../../common/global_variables.dart';
import 'widgets/banner_widget.dart';
import 'widgets/list_category_widget.dart';
import 'widgets/list_product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                GlobalVariables.blueTextColor,
                GlobalVariables.blueTextColor.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 3,
                    child: TextFormField(
                      controller: searchController,
                      onFieldSubmitted: (_) {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return SearchPage(search: searchController.text);
                        // }));
                      },
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search ',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          ListCategoryWidget(),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BannerWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'List Product',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(child: ListProductWidget()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: GlobalVariables.blueTextColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: (index) {},
        items: [
          // HOME
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.blueTextColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),
          // ACCOUNT
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.blueTextColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return const AccountPage();
                  // }));
                },
                child: const Icon(
                  Icons.person_outline_outlined,
                ),
              ),
            ),
            label: '',
          ),
          // CART
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.blueTextColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              // child: BlocBuilder<CheckoutBloc, CheckoutState>(
              //   builder: (context, state) {
              //     if (state is CheckoutLoaded) {
              //       return badges.Badge(
              //         badgeStyle: const badges.BadgeStyle(
              //             elevation: 0, badgeColor: Colors.white),
              //         // elevation: 0,
              //         badgeContent: Text(
              //           '${state.items.length}',
              //           style: const TextStyle(color: Color(0xffEE4D2D)),
              //         ),
              //         // badgeColor: Colors.white,
              //         child: InkWell(
              //           onTap: () {
              //             Navigator.push(context,
              //                 MaterialPageRoute(builder: (context) {
              //               return const CartPage();
              //             }));
              //           },
              //           child: const Icon(
              //             Icons.shopping_cart_outlined,
              //           ),
              //         ),
              //       );
              //     }
              //     return const badges.Badge(
              //       badgeStyle: badges.BadgeStyle(
              //           elevation: 0, badgeColor: Colors.white),
              //       // elevation: 0,
              //       badgeContent: Text(
              //         '0',
              //         style: TextStyle(color: Color(0xffEE4D2D)),
              //       ),
              //       // badgeColor: Colors.white,
              //       child: Icon(
              //         Icons.shopping_cart_outlined,
              //       ),
              //     );
              //   },
              // ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
