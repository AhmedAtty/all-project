import 'package:flutter/material.dart';
import 'package:smm_app/models/category.dart';
import 'package:smm_app/screens/services_screen.dart';
import 'package:smm_app/utils/app_colors.dart';
import 'package:smm_app/utils/app_styles.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ServicesScreen(),
            settings: RouteSettings(arguments: category),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                Image.network(
                  category.image!,
                  width: 50,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Spacer(),
                Text(
                  category.name!,
                  style: AppStyles.bold(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
