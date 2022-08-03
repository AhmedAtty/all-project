import 'package:flutter/material.dart';
import 'package:smm_app/generated/l10n.dart';
import 'package:smm_app/models/requests/order_request.dart';
import 'package:smm_app/models/service.dart';
import 'package:smm_app/screens/payment_screen.dart';
import 'package:smm_app/utils/app_styles.dart';
import 'package:smm_app/widgets/custom_elevated_button.dart';

class CreateOrderScreen extends StatefulWidget {
  final Service service;
  const CreateOrderScreen({Key? key, required this.service}) : super(key: key);

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  late List<int> items;
  int value = 1;

  @override
  void initState() {
    super.initState();
    items = List.generate(100, (index) => (index + 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).createOrder),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.service.name!,
                style: AppStyles.bold(fontSize: 18),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).quantity,
                    style: AppStyles.bold(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  if (widget.service.priceAfter == null)
                    DropdownButton<int>(
                        value: value,
                        style: AppStyles.semiBold(fontSize: 18),
                        underline: Container(),
                        borderRadius: BorderRadius.circular(4),
                        itemHeight: 50,
                        items: items
                            .map(
                              (e) => DropdownMenuItem<int>(
                                value: e,
                                child: Text(
                                  e.toString(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (va) {
                          setState(() {
                            value = va!;
                          });
                        }),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).price,
                    style: AppStyles.bold(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'EGP ${value * ((widget.service.priceAfter != null) ? widget.service.priceAfter! : widget.service.price!)}',
                    style: AppStyles.semiBold(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              CustomElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PaymentScreen(),
                        settings: RouteSettings(
                          arguments: OrderRequest(
                              quantity: value, service: widget.service),
                        ),
                      ),
                    );
                  },
                  text: S.of(context).continu),
            ],
          ),
        ),
      ),
    );
  }
}
