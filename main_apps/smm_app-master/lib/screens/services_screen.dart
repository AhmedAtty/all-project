import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/models/category.dart';
import 'package:smm_app/providers/services_provider.dart';
import 'package:smm_app/widgets/service_widget.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  late Category category;
  late ServicesProvider _servicesProvider;

  @override
  void didChangeDependencies() {
    _servicesProvider = Provider.of<ServicesProvider>(context);
    category = ModalRoute.of(context)!.settings.arguments as Category;
    _servicesProvider.getCategoryServices(context, categoryId: category.id!);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name!),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _servicesProvider.services.length,
        itemBuilder: (context, index) {
          return ServiceWidget(
              index: index, service: _servicesProvider.services[index]);
        },
      ),
    );
  }
}
