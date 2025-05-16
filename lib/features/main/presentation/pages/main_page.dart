import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_workshop_01/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_workshop_01/features/main/presentation/bloc/main_state.dart';
import 'package:flutter_workshop_01/features/main/presentation/widgets/main_bottom_navigater.dart';

import '../../../cart/presentation/pages/cart_page.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../search/presentation/pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _controller = PageController();

  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return _pages[1];
      }));
    } else {
      setState(() {
        _selectedIndex = index;
      });
      _controller.jumpToPage(index);
    }
  }

  void _onPageChanged(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("test")),
      body: Column(
        children: [
          BlocBuilder<MainBloc, int>(
            builder: (context, count) {
              return Text('$count');
            },
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: _onPageChanged,
              children: _pages,
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
          onTap: () => context.read<MainBloc>().add(MainIncrement()),
          child: const Text("Test")),
      bottomNavigationBar: MainBottomNavigator(
          onTapEvent: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }
}
