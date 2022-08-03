import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/models/service.dart';
import 'package:smm_app/providers/services_provider.dart';
import 'package:smm_app/screens/create_order_screen.dart';
import 'package:smm_app/utils/app_styles.dart';

class ServiceWidget extends StatefulWidget {
  final int index;
  final Service service;
  const ServiceWidget({Key? key, required this.index, required this.service})
      : super(key: key);

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  late ServicesProvider _servicesProvider;

  @override
  void didChangeDependencies() {
    _servicesProvider = Provider.of<ServicesProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CreateOrderScreen(
              service: widget.service,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
            left: 16,
            right: 16,
            top: widget.index == 0 ? 10 : 5,
            bottom: widget.index == (_servicesProvider.services.length - 1)
                ? 10
                : 5),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            // height: 200,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(10),
                      topEnd: Radius.circular(10),
                    ),
                  ),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      widget.service.image!,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.service.name!,
                        style: AppStyles.bold(fontSize: 16),
                      ),
                      Text(
                        widget.service.description!,
                        // maxLines: 5,
                        style: AppStyles.regular(),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
