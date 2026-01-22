import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/src/data/models/user_model.dart';
import 'package:random_user/src/viewModel/user_viewmodel.dart';
import 'package:random_user/src/widgets/avatar_circle.dart';
import 'package:random_user/src/widgets/custom_appbar.dart';
import 'package:random_user/src/widgets/info_row.dart';
import 'package:random_user/src/utils/date_mask.dart';

class DetailsView extends StatelessWidget {
  final UserModel user;
  const DetailsView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UserViewModel>();
    final saved = vm.isUserSaved(user);

    return Scaffold(
      appBar: CustomAppbar(title: 'Detalhes do Usuário',),
      body: _buildBody(user),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (saved) {
            await vm.deleteSavedUser(user);
            await vm.loadSavedUsers();
            Navigator.pop(context);
          } else {
            await vm.saveUser(user);
          }
        },
        child: Icon(saved ? Icons.delete : Icons.save),
      ),
    );
  }

  Widget _buildBody(UserModel user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AvatarCircle(picture: user.picture.large),
          const SizedBox(height: 16),

          const Text('Olá!, meu nome é', style: TextStyle(fontSize: 16)),
          Text(
            user.name.fullName,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Contato',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          InfoRow(icon: Icons.email, text: user.email),
          InfoRow(icon: Icons.phone, text: user.phone),
          InfoRow(icon: Icons.cake, text: DateMask.format(user.dob.date)),

          const SizedBox(height: 24),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Localização',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          InfoRow(icon: Icons.location_on, text: user.location.street.adress),
          InfoRow(
            icon: Icons.map,
            text:
                '${user.location.city}, ${user.location.state}, ${user.location.country}',
          ),

          const SizedBox(height: 24),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          InfoRow(icon: Icons.person, text: user.login.username),
          InfoRow(icon: Icons.lock, text: user.login.password),
        ],
      ),
    );
  }
}
