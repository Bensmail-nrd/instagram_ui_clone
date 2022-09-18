import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_ui_clone/presentation/screen/profile_screen.dart';
import 'package:instagram_ui_clone/presentation/widget/user_icon.dart';
import 'package:instagram_ui_clone/res.dart';

import '../widget/post.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Text(
                                      "Instagram",
                                      style: GoogleFonts.pacifico(fontSize: 30),
                                    ),
                                    const Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(Res.ajouter, width: 22),
                                    Image.asset(Res.cur_1, width: 22),
                                    Builder(builder: (context) {
                                      return InkWell(
                                          onTap: () {
                                            Scaffold.of(context)
                                                .openEndDrawer();
                                          },
                                          child: Image.asset(Res.messager,
                                              width: 22));
                                    }),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Expanded(
                          child: ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: 65,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 15,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: UserIcon(type: 0));
                              },
                            ),
                          ),
                          const Divider(color: Colors.grey),
                          Column(
                            children: const [
                              Post(),
                              Post(),
                              Post(),
                              Post(),
                              Post(),
                              Post(),
                              Post(),
                              Post(),
                              Post(),
                              Post(),
                              Post(),
                              Post(),
                              Post(),
                              Post(),
                              Post(),
                            ],
                          ),
                        ],
                      )),
                    ],
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.blue,
                      );
                    },
                    itemCount: 12,
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.blue,
                      );
                    },
                    itemCount: 12,
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.blue,
                      );
                    },
                    itemCount: 12,
                  ),
                  const ProfileScreen(),
                ]),
          ),
          TabBar(
            controller: tabController,
            tabs: [
              Image.asset(Res.accueil, width: 25),
              Image.asset(Res.search, width: 25),
              Image.asset(Res.diffuser, width: 25),
              Image.asset(Res.sac, width: 25),
              UserIcon()
            ],
          )
        ],
      ),
    );
  }
}
