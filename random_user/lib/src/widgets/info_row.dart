import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final IconData? icon;
  final String text;
  final String? hint;
  final String? flagCode;
  InfoRow({super.key, this.flagCode,this.icon, required this.text, this.hint})
  //rotina para garantir apenas 1 no inforow
    : assert(
  [icon != null, hint != null, flagCode != null].where((e) => e).length == 1,
  'Você deve fornecer apenas um: icon, hint ou flagCode',
);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (flagCode != null)
            Flag.fromString(
              flagCode!,
              height: 20,
              width: 36,
            ),

          if (icon != null)
            Icon(icon, color: Theme.of(context).colorScheme.primary),
  
          if (hint != null)
            Text('$hint: ', style: TextStyle(fontWeight: FontWeight.bold)),

          const SizedBox(width: 12),

          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
