import 'package:flutter/material.dart';
import 'package:freshlogistics/utils/constants/colors.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.person,
          size: 30,
          color: AppColors.white,
        ),
      ),
      title: Text('Emmanuel Wediah', style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColors.white)),
      subtitle: Text('emmawediah@example.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Icons.edit, color: AppColors.white)),
    );
  }
}
