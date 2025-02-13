import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notepad/core/constants/navigation_constants.dart';
import 'package:notepad/models/note_model.dart';
import 'package:notepad/models/user_model.dart';
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
  bool _isSelectionMode = false;
  Set<int> _selectedNoteIds = {};

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
      floatingActionButton: !_isSelectionMode
          ? FloatingActionButton(
              onPressed: () {
                context.push(NavigationConstants.createNoteScreen);
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 35,
              ),
            )
          : FloatingActionButton(
              onPressed: () async {
                if (_selectedNoteIds.isNotEmpty) {
                  bool response = await context
                      .read<NoteProvider>()
                      .deleteNotes(noteIds: _selectedNoteIds.toList());
                  if (response) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          '${_selectedNoteIds.length} not başarıyla silindi.'),
                      duration: Duration(seconds: 1),
                    ));
                    setState(() {
                      _isSelectionMode = false;
                      _selectedNoteIds.clear();
                    });
                  }
                }
              },
              backgroundColor: Colors.red,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 35,
              ),
            ),
      appBar: AppBar(
        leading: _isSelectionMode
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _isSelectionMode = false;
                    _selectedNoteIds.clear();
                  });
                },
              )
            : null,
        title: _isSelectionMode
            ? Text('${_selectedNoteIds.length} not seçildi')
            : Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Merhaba, ${currentUser?.username}"),
              ),
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
      ),
      drawer: CustomDrawer(currentUser: currentUser),
      body: SingleChildScrollView(
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
                          return NoteListItem(
                            note: note,
                            isSelectionMode: _isSelectionMode,
                            isSelected: _selectedNoteIds.contains(note.id),
                            onLongPress: () {
                              setState(() {
                                _isSelectionMode = true;
                                _selectedNoteIds.add(note.id);
                              });
                            },
                            onTap: () {
                              if (_isSelectionMode) {
                                setState(() {
                                  if (_selectedNoteIds.contains(note.id)) {
                                    _selectedNoteIds.remove(note.id);
                                    if (_selectedNoteIds.isEmpty) {
                                      _isSelectionMode = false;
                                    }
                                  } else {
                                    _selectedNoteIds.add(note.id);
                                  }
                                });
                              } else {
                                context.push(
                                  NavigationConstants.updateNoteScreen,
                                  extra: note,
                                );
                              }
                            },
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.currentUser,
  });

  final User? currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}

class NoteListItem extends StatelessWidget {
  final NoteModel note;
  final bool isSelectionMode;
  final bool isSelected;
  final VoidCallback onLongPress;
  final VoidCallback onTap;

  const NoteListItem({
    super.key,
    required this.note,
    required this.isSelectionMode,
    required this.isSelected,
    required this.onLongPress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Column(
        children: [
          Stack(
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
                  border: isSelected
                      ? Border.all(color: Colors.blue, width: 2)
                      : null,
                ),
                child: Text(
                  note.content,
                  style: const TextStyle(fontSize: 18),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isSelectionMode)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? Colors.blue : Colors.grey.shade200,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 20,
                      color: isSelected ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            note.title,
            style: const TextStyle(fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            DateFormat('d MMM y', 'tr_TR').format(note.updatedAt),
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
