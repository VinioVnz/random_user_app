import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:random_user/src/data/models/user_model.dart';
import 'package:random_user/src/viewModel/user_viewmodel.dart';
import 'package:random_user/src/widgets/avatar_circle.dart';
import 'package:random_user/src/widgets/custom_appbar.dart';
import 'package:random_user/src/widgets/info_item.dart';
import 'package:random_user/src/utils/date_mask.dart';
import 'package:random_user/src/widgets/info_section.dart';


class DetailsView extends StatelessWidget {
  final UserModel user;
  const DetailsView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UserViewModel>();
    final saved = vm.isUserSaved(user);

    return Scaffold(
      appBar: CustomAppbar(title: 'Detalhes do Usuário'),
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

          const Text('Olá, meu nome é', style: TextStyle(fontSize: 16)),
          Text(
            user.name.fullName,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          InfoSection(
            title: 'Contato',
            items: [
              InfoItem(icon: Icons.email, text: user.email),
              InfoItem(icon: Icons.phone, text: user.phone),
            ],
          ),

          const SizedBox(height: 24),

          InfoSection(
            title: 'Localização',
            items: [
              InfoItem(icon: Icons.location_on, text: user.location.street.adress),
              InfoItem(icon: Icons.map, text: user.location.fullLocation),
            ],
          ),

          const SizedBox(height: 24),

          InfoSection(
            title: 'Login',
            items: [
              InfoItem(icon: Icons.person, text: user.login.username),
              InfoItem(icon: Icons.lock, text: user.login.password),
            ],
          ),

          const SizedBox(height: 24),

          InfoSection(
            title: 'Registro',
            items: [
              InfoItem(icon: FontAwesomeIcons.userCheck, text: DateMask.format(user.registered.date)),
              InfoItem(icon: FontAwesomeIcons.clock, text: '${user.registered.age.toString()} anos'),
            ],
          ),

          const SizedBox(height: 24),

          InfoSection(
            title: 'Aniversário',
            items: [
              InfoItem(icon: Icons.cake, text: DateMask.format(user.dob.date)),
              InfoItem(icon: FontAwesomeIcons.hourglass, text: '${user.dob.age.toString()} anos'),
            ],
          ),

          const SizedBox(height: 24),

          InfoSection(
            title: 'Infos',
            items: [
              InfoItem(hint: 'Tipo', text: user.id.name.isNotEmpty ? user.id.name : 'Não informado'),
              InfoItem(hint: 'Documento',text:user.id.value ?? 'Não informado'),
              InfoItem(flagCode: user.nat, text: user.nat),
            ],
          ),

        ],
      ),
    );
  }
}
