import 'package:flutter/material.dart';
import 'package:random_user/src/widgets/info_item.dart';
import 'info_row.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final List<InfoItem> items;

  const InfoSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...items.map((item) => InfoRow(
              icon: item.icon,
              text: item.text,
              hint: item.hint,
              flagCode: item.flagCode,
            )),
      ],
    );
  }
}
