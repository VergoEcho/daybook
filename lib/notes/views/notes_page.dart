import 'package:daybook/notes/bloc/note_bloc.dart';
import 'package:daybook/notes/views/notes_drawer.dart';
import 'package:daybook/notes/views/notes_list.dart';
import 'package:daybook/notes/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  static String route = '/home';

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32, right: 8),
        child: Builder(builder: (context) {
          return FloatingActionButton(
            child: const Icon(Icons.edit_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
      ),
      drawer: const NotesDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: ShaderMask(
                blendMode: BlendMode.softLight,
                shaderCallback: (Rect rect) {
                  return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                        0.0,
                        0.05,
                      ],
                      colors: [
                        // Colors.black,
                        Theme.of(context).backgroundColor,
                        Colors.white.withOpacity(0),
                      ]).createShader(rect);
                },
                child: ListView(
                  controller: _scrollController,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Welcome back, Jane!',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              Text('How are you feeling today ?',
                                  style: Theme.of(context).textTheme.headline3),
                            ],
                          ),
                        ),
                        Image.asset(
                          height: 64,
                          width: 70,
                          'images/mini_avatar.png',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 128,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'images/cats/fat_cat.png',
                            width: 88,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Image.asset(
                              'images/cats/write_cat.png',
                              width: 112,
                            ),
                          ),
                          Image.asset(
                            'images/cats/love_cat.png',
                            width: 88,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(),
                    Text(
                      'Yesterday',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Divider(),
                    const SizedBox(height: 16),
                    const NotesList(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<NoteBloc>().add(NoteFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= maxScroll * 0.9;
  }
}
