import 'package:flutter/material.dart';

import 'opacity_animated.dart';

class ListAnimated extends StatefulWidget {
  const ListAnimated({Key? key}) : super(key: key);
  static const routeName = '/list-animated';

  @override
  State<ListAnimated> createState() => _ListAnimatedState();
}

class _ListAnimatedState extends State<ListAnimated> {
  final _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _items.insert(0, 'Item ${_items.length + 1}');
    _key.currentState!.insertItem(
      0,
      duration: const Duration(seconds: 1),
    );
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            color: Colors.redAccent,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                'Deleted',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      },
      duration: const Duration(seconds: 1),
    );
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    onPressed: _addItem,
                    icon: const Icon(Icons.add),
                  ),
                  Expanded(
                    child: AnimatedList(
                      key: _key,
                      initialItemCount: 0,
                      itemBuilder: (context, index, animation) {
                        return SizeTransition(
                          sizeFactor: animation,
                          key: UniqueKey(),
                          child: Card(
                            color: Colors.lightBlueAccent,
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Text(
                                _items[index],
                                style: const TextStyle(fontSize: 20),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_outline_rounded),
                                onPressed: () {
                                  _removeItem(index);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, OpacityAnimated.routeName),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Icon(Icons.arrow_forward_rounded)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
