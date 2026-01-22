import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/src/view/details_view.dart';
import 'package:random_user/src/viewModel/user_viewmodel.dart';
import 'package:random_user/src/widgets/custom_appbar.dart';

class SavedUsersView extends StatefulWidget {
  const SavedUsersView({super.key});

  @override
  State<SavedUsersView> createState() => _SavedUsersViewState();
}

class _SavedUsersViewState extends State<SavedUsersView> {
  @override
  void initState() {
    super.initState();

    Future.microtask((){
      context.read<UserViewModel>().loadSavedUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UserViewModel>();

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Salvos',
        
      ),
      body: _buildBody(vm),
    );
  }

  @override
  Widget _buildBody(UserViewModel vm) {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: vm.savedUsers.length,
        itemBuilder: (context, index) {
          final user = vm.savedUsers[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.picture.thumbnail),
            ),
            title: Text(user.name.fullName),
            subtitle: Text(user.email),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailsView(user: user)),
              );
            },
          );
        },
      ),
    );
    ;
  }
}
