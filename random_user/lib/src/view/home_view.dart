import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/src/viewModel/user_viewmodel.dart';
import 'package:random_user/src/widgets/custom_appbar.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final vm = context.read<UserViewModel>();
      vm.getUser();
      vm.startTicker(this);
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UserViewModel>();

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Home',
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.save))],
      ),
      body: _buildBody(vm),
    );
  }

  Widget _buildBody(UserViewModel vm) {
    if (vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vm.error != null) {
      return Center(child: Text(vm.error!));
    }


    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: vm.users.length,
        itemBuilder: (context, index) {
          final user = vm.users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.picture.thumbnail),
            ),
            title: Text(user.name.fullName),
            subtitle: Text(user.email),
            onTap: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => UserDetailView(user: user)),
              ); */
            },
          );
        },
      ),
    );
  }
}
