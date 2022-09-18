import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/presentation/widget/user_icon.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserIcon(type: 0),
                    const Text("Bens_Noureddine\nNetwork Engineer")
                  ],
                ),
                Column(
                  children: const [
                    Text("25", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      "Posts",
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text("468", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      "Followers",
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text("516", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      "Following",
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black12),
                  child: const Text(
                    "Edit Profile",
                    textAlign: TextAlign.center,
                  ),
                )),
                Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black12),
                  child: const Icon(Icons.add_chart_outlined),
                )
              ],
            ),
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(child: Icon(Icons.grid_4x4, color: Colors.black)),
                Tab(child: Icon(Icons.person_pin_rounded, color: Colors.black))
              ],
            ),
            Expanded(
                child: TabBarView(
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  shrinkWrap: true,
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  shrinkWrap: true,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
