import 'package:flutter/material.dart';
import 'package:olah_data/Data/game_store_data.dart';
import 'package:olah_data/test/login_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        // automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          IconButton(
            onPressed: () {
              _logout(context);
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("Selamat Datang $username", style: TextStyle(fontSize: 25)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, Index) {
                    return _gameStore(context, Index);
                  },
                  itemCount: gameList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ),
      (route) => false,
    );
  }
}

Widget _gameStore(context, int Index) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all()),
      child: Column(children: [Image.network(gameList[Index].imageUrls[0])]),
    ),
  );
}
