import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/providers/orders_provider.dart';
import 'package:smm_app/widgets/order_widget.dart';

import '../generated/l10n.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  late OrdersProvider _ordersProvider;

  @override
  void didChangeDependencies() async {
    _ordersProvider = Provider.of<OrdersProvider>(context);
    await _ordersProvider.getOrders(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).myOrders),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _ordersProvider.orders.length,
        itemBuilder: (context, index) {
          return OrderWidget(
            index: index,
          );
        },
      ),
    );
  }
}
