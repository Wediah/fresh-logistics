import 'package:flutter/material.dart';
import 'package:freshlogistics/common/styles/spacing_styles.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Icon(Icons.check, size: 24, color: Colors.green),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Sizes.spaceBtwSections),

              Text(
                'Success!',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Sizes.spaceBtwItems),
              Text(
                'Your action was successful.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Sizes.spaceBtwItems),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Back'),
              ),
            ],
          )
        ),
      ),
    );
  }
}