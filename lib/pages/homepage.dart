import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/provider.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  void clearcontroller() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Providers>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("N O T E S  APP"),
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout_sharp,
              ))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[800],
            ),
            child: const TextField(
              // controller: passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search here',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: item.items.length,
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      tileColor: Colors.grey[700],
                      title: Text(
                        item.items[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  )),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.grey[600],
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: ((context) {
                return SizedBox(
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Center(
                          child: Text(
                        'ADD  T A S K ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 30),
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: 'add task here',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Center(
                        child: MaterialButton(
                          color: Colors.grey[700],
                          onPressed: () {
                            item.additems(controller);
                            clearcontroller();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "ADD",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white70,
        ),
      ),
    );
  }
}
