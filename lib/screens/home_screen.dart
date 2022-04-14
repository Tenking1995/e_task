import 'dart:developer';

import 'package:e_task/providers/tasks.dart';
import 'package:e_task/screens/edit_task_screen.dart';
import 'package:e_task/widgets/task_list.dart';
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';

enum HomeOptions {
  add,
  show,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _isLoading = false;

  // * useful tips: ClassName()..function1()..function2(); call method one after one
  // * adaptive for android and iphone ui design with 'adaptive'
  // * SwitchListTile.adaptive(
  // * title: const Text('Lights'),
  // * value: _isSelected,
  // * onChanged: onChanged,
  // * secondary: Icon(Icons.adaptive.share),
  // * );

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); //  not working
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    // or in didChangeDependencies
    super.initState();
    log('initState test');
    // throw ('initState test throw error');
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Tasks>(context).fetchAndSetTasks().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ETask'),
          actions: [
            PopupMenuButton(
              onSelected: (HomeOptions selectedValue) {
                setState(() {
                  if (selectedValue == HomeOptions.add) {
                    // _showOnlyCompleted = true;
                    Navigator.of(context).pushNamed(EditTaskScreen.routeName);
                  }
                  // else {
                  //   _showOnlyCompleted = false;
                  // }
                });
              },
              itemBuilder: (_) => [
                const PopupMenuItem(child: Text('Add Task (Employer Test)'), value: HomeOptions.add),
                // const PopupMenuItem(child: Text('Show All'), value: HomeOptions.Show),
              ],
              icon: const Icon(Icons.add),
            ),
            // Consumer<Cart>(
            //   builder: (_, cart, ch) => Badge(
            //     child: ch,
            //     value: cart.itemCount.toString(),
            //   ),
            //   child: IconButton(
            //     icon: const Icon(Icons.shopping_cart),
            //     onPressed: () {
            //       // Navigator.of(context).pushNamed(CartScreen.routeName);
            //     },
            //   ),
            // ),
          ],
        ),
        drawer: const AppDrawer(),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : const TaskList() // ProductsGrid(_showOnlyFavorites),
        );
  }
}
