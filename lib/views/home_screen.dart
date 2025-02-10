import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/constants/navigation_constants.dart';
import 'package:notepad/models/note_model.dart';
import 'package:notepad/viewmodels/auth_provider.dart';
import 'package:notepad/viewmodels/note_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NoteProvider>().getNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final currentUser = authProvider.user;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text("Merhaba, ${currentUser?.username}"),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Not Defteri',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currentUser?.username ?? '',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined, color: Colors.red),
              title: const Text(
                'Çıkış Yap',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () async {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text('Çıkış Yap'),
                    content:
                        const Text('Çıkış yapmak istediğinize emin misiniz?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('İptal'),
                      ),
                      TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          bool response =
                              await context.read<AuthProvider>().logout();
                          if (response) {
                            context.go(NavigationConstants.loginScreen);
                          }
                        },
                        child: const Text(
                          'Çıkış Yap',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox.fromSize(
          size: MediaQuery.of(context).size,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Consumer<NoteProvider>(
                builder: (context, noteProvider, child) {
                  if (noteProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return noteProvider.notes.isEmpty
                      ? const Center(
                          child: Text('Henüz not eklenmemiş'),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          itemCount: noteProvider.notes.length,
                          padding: const EdgeInsets.all(10),
                          itemBuilder: (context, index) {
                            final note = noteProvider.notes[index];
                            return NoteListItem(note: note);
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteListItem extends StatelessWidget {
  final NoteModel note;

  const NoteListItem({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(NavigationConstants.noteScreen);
      },
      child: Column(
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
            child: Text(
              note.content,
              style: const TextStyle(fontSize: 18),
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            note.title,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            DateFormat('d MMM y', 'tr_TR').format(note.date),
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
