import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  final String? picture;
  const AvatarCircle({super.key, required this.picture});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3
        )
      ),
      child: ClipOval(
              child: picture != null
                  ? Image.network(
                      picture!,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 120,
                      height: 120,
                      color: Colors.grey[300],
                      child: const Icon(Icons.person, size: 50),
                    ),
            ),
    );
  }
}