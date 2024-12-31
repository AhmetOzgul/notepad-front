import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/constants/navigation_constants.dart';
import 'package:notepad/viewmodels/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    final currentUser = authProvider.user;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox.fromSize(
          size: MediaQuery.of(context).size,
          child: Column(
            children: [
              AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("Merhaba, ${currentUser?.username}"),
                ),
                backgroundColor: Colors.white,
                elevation: 5,
                shadowColor: Colors.black,
                actions: [
                  IconButton(
                      onPressed: () async {
                        bool response =
                            await context.read<AuthProvider>().logout();
                        if (response) {
                          context.go(NavigationConstants.loginScreen);
                        }
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.red,
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  padding: const EdgeInsets.all(10),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    NoteListItem(),
                    NoteListItem(),
                    NoteListItem(),
                    NoteListItem(),
                    NoteListItem(),
                    NoteListItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteListItem extends StatelessWidget {
  const NoteListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.width / 2 - 40,
          width: MediaQuery.of(context).size.width / 2 - 40,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 6),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "Content",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Başlık",
          style: TextStyle(fontSize: 20),
        ),
        const Text(
          "Tarih",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }
}
