import 'package:flutter/material.dart';
import 'package:freshlogistics/utils/constants/colors.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.primaryGreen,
              padding: const EdgeInsets.all(0),
              child: Stack(
                children: [
                  Container(
                    width: 400,
                    height: 400,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ],
              )
            )
          ],
        )
      )
    );
  }
}