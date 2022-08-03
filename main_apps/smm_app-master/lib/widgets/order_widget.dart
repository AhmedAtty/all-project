import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/generated/l10n.dart';
import 'package:smm_app/providers/orders_provider.dart';
import 'package:smm_app/utils/app_colors.dart';
import 'package:smm_app/utils/app_styles.dart';

class OrderWidget extends StatefulWidget {
  final int index;
  const OrderWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  late OrdersProvider _ordersProvider;

  @override
  void didChangeDependencies() {
    _ordersProvider = Provider.of<OrdersProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsetsDirectional.only(
          top: widget.index == 0 ? 12 : 6,
          bottom: widget.index == (_ordersProvider.orders.length - 1) ? 12 : 6,
          start: 16,
          end: 16),
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  PositionedDirectional(
                    top: 0,
                    bottom: 0,
                    end: 0,
                    start: 0,
                    child: Container(
                      // width: double.infinity,
                      // height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(4),
                          topEnd: Radius.circular(4),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: Image.network(
                          _ordersProvider.orders[widget.index].service!.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    end: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 6),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(4),
                          topEnd: Radius.circular(4),
                        ),
                      ),
                      child: Text(
                        _ordersProvider.orders[widget.index].serviceStatus!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.semiBold(
                            color: AppColors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        _ordersProvider.orders[widget.index].service!.name!,
                        style: AppStyles.bold(fontSize: 16),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          S.of(context).date,
                          style: AppStyles.bold(fontSize: 16),
                        ),
                        const Spacer(),
                        Text(
                          _ordersProvider.orders[widget.index].createdAt!,
                          style: AppStyles.regular(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Text(
                      _ordersProvider
                          .orders[widget.index].service!.description!,
                      style: AppStyles.regular(fontSize: 14),
                      // maxLines: 3,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(4),
                      bottomEnd: Radius.circular(4),
                    ),
                  ),
                  child: Text(
                    "${_ordersProvider.orders[widget.index].service!.currency!} ${_ordersProvider.orders[widget.index].total!}",
                    style: AppStyles.semiBold(
                        color: AppColors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
