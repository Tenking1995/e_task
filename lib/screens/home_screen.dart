import 'package:my_app/providers/blogs.dart';
import 'package:my_app/widgets/blog_list.dart';
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _isLoading = false;
  int _selectedIndex = 0;
  final List<Widget> _items = [
    const BlogList(),
    const Center(
      child: Text('2nd Page'),
    ),
    const Center(
      child: Text('Profile Page'),
    ),
  ];

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); //  not working
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    // or in didChangeDependencies
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Blogs>(context).fetchAndSetBlogs(null).then((_) {
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
        title: const Text('Blogs'),
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : IndexedStack(index: _selectedIndex, children: _items), // ProductsGrid(_showOnlyFavorites),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
        iconSize: 20,
        // type: BottomNavigationBarType.shifting, // * highlight selected tab
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 15,
        selectedIconTheme: const IconThemeData(color: Colors.white, size: 25),
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
