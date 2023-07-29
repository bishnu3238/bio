import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/class/model/order/order_model.dart';
import 'package:universal_lab/class/user_services/user_services.dart';
import 'package:universal_lab/package/custom_widgets/app_bars/simple_app_bar.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/screens/home_page/sub_home_page/my_orders/view_invoice/view_invoice_class.dart';

import '../../../../../class/model/user/user_address.dart';
import '../../../../../package/text_style.dart';
import '../../../../user_profile/sub_user_profile/addrss_tile.dart';
import '../../settings/sub_settings/options_card.dart';

class ViewInvoice extends StatelessWidget {
  final OrderModel orderModel;
  const ViewInvoice(this.orderModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ViewInvoiceClass()..getAddressDetails(orderModel.id),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              appBar: SimpleAppBar(
                title: "Invoice",
                icon: Icons.arrow_back_ios,
                todo: () => Navigator.of(context).pop(),
              ),
              body: Consumer<ViewInvoiceClass>(
                builder: (context, data, _) {
                  if (data.isError) {
                    const Center(
                      child: Text("Invoice not generated"),
                    );
                  }
                  if (data.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: kPrimeColor,
                        backgroundColor: kGrey.withOpacity(0.1),
                      ),
                    );
                  } else {
                    return InteractiveViewer(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InvoiceInfo(orderModel: orderModel),
                              Addresses(orderModel: orderModel, data: data),
                              OrderInvoiceDetails(
                                  orderModel: orderModel, data: data),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class InvoiceInfo extends StatelessWidget {
  const InvoiceInfo({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Container(
          height: getProportionateScreenHeight(150),
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                appLogo,
                width: getProportionateScreenWidth(100),
                height: getProportionateScreenHeight(50),
              ),
              const Text(appName),
              const AutoSizeText(
                appAddress,
                maxLines: 2,
              ),
              gap(5),
              const AutoSizeText("Contact Info $gPayNumber"),
              const AutoSizeText("Email Id Info@biocellar.com"),
            ],
          ),
        )),
        Expanded(
          child: Container(
            height: getProportionateScreenHeight(150),
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Rows(
                  title: Text('Date Added: ${orderModel.date}'),
                  widget: const Text(""),
                ),
                Rows(
                  title: Text('Order ID: ${orderModel.id}'),
                  widget: const Text(""),
                ),
                Rows(
                  title: Text('Pay Methode: ${orderModel.paid}'),
                  widget: const Text(""),
                ),
                const Rows(
                  title: Text('Shipping Methode: ${null}'),
                  widget: Text(""),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Addresses extends StatelessWidget {
  final OrderModel orderModel;
  final ViewInvoiceClass data;
  const Addresses({super.key, required this.orderModel, required this.data});

  @override
  Widget build(BuildContext context) {
    final paymentAddress = data.deliveryAddress.payAddress(context);
    final shippingAddress = data.deliveryAddress.shippingAddress(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _AddressColumn(address: paymentAddress, label: 'Payment Address'),
        _AddressColumn(address: shippingAddress, label: 'Shipping Address'),
      ],
    );
  }
}

class _AddressColumn extends StatelessWidget {
  const _AddressColumn({required this.label, required this.address});
  final String label;
  final Address address;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
                left: BorderSide(color: kGrey),
                right: BorderSide(color: kGrey))),
        child: Column(
          children: [
            Rows(label: label, widget: const SizedBox()),
            const Divider(),
            _ShowAddress(address: address),
          ],
        ),
      ),
    );
  }
}

class _ShowAddress extends StatelessWidget {
  const _ShowAddress({required this.address});

  final Address address;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(address.name,
          maxLines: 1, style: stlT.copyWith(fontWeight: FontWeight.normal)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            address.delivery_add,
            maxLines: 2,
            style: stlight.copyWith(fontWeight: FontWeight.w600),
          ),
          FittedBox(
            child: AutoSizeText(
              '${address.city} - ${address.pincode_id}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: stlight.copyWith(fontWeight: FontWeight.w100),
            ),
          ),
          AutoSizeText(
            address.state,
            maxLines: 1,
            style: stlight.copyWith(fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}

extension GetAddressFromDeliveryAddressId on DeliveryAddress {
  Address payAddress(BuildContext context) {
    return context
        .read<UserServices>()
        .address
        .singleWhere((element) => element.id == add_mas_id);
  }
}

extension GetShippigAddressFromDeliveryAddressId on DeliveryAddress {
  Address shippingAddress(BuildContext context) {
    return context
        .read<UserServices>()
        .address
        .singleWhere((element) => element.id == add_mas_id2);
  }
}

// class BillTableDataSource extends DataTableSource {
//   final OrderModel orderModel;
//
//   BillTableDataSource(this.orderModel);
//
//   @override
//   DataRow getRow(int index) {
//     final product = orderModel.orderItems[index];
//     return DataRow(cells: [
//       DataCell(Text(index.toString())),
//       DataCell(Text(product.productName)),
//       DataCell(Text(product.quantity.toString())),
//       DataCell(Text(product.price.toString())),
//       DataCell(Text(product.totalPrice.toString())),
//     ]);
//   }
//
//   @override
//   bool get isRowCountApproximate => false;
//
//   @override
//   int get rowCount => orderModel.orderItems.length;
//
//   @override
//   int get selectedRowCount => 0;
// }

class OrderInvoiceDetails extends StatelessWidget {
  final OrderModel orderModel;
  final ViewInvoiceClass data;
  const OrderInvoiceDetails(
      {super.key, required this.orderModel, required this.data});

  @override
  Widget build(BuildContext context) {
    double totalAmount = orderModel.orderItems
        .fold(0, (sum, product) => sum + product.totalPrice);
    String finalAmount =
        (totalAmount + (double.tryParse(data.deliveryAddress.shipping) ?? 0))
            .round()
            .toStringAsFixed(0)
            .toString();

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              DataTable(
                columnSpacing: 5.0,
                checkboxHorizontalMargin: 0,
                horizontalMargin: 3.0,
                border: TableBorder.all(),
                columns: const [
                  DataColumn(label: Text('Sl No')),
                  DataColumn(label: Text('Product Name')),
                  DataColumn(label: Text('Quantity')),
                  DataColumn(label: Text('Price')),
                  DataColumn(label: Text('Product Total')),
                ],
                rows: List.generate(
                  orderModel.orderItems.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text((index + 1).toString())),
                      DataCell(Text(orderModel.orderItems[index].productName)),
                      DataCell(Text(
                          orderModel.orderItems[index].quantity.toString())),
                      DataCell(Text(orderModel.orderItems[index].price
                          .round()
                          .toString())),
                      DataCell(Text(orderModel.orderItems[index].totalPrice
                          .round()
                          .toString())),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          width: getProportionateScreenWidth(kLayoutWidth),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Sub Total: ${totalAmount.toStringAsFixed(0)}',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Shipping Charge: ${data.deliveryAddress.shipping}',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Text(
                'Total Amount: $finalAmount',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const Divider(),
            ],
          ),
        ),
      ],
    );
  }
}
