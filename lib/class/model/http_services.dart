import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/product_master/catergory_model.dart';
import 'package:universal_lab/class/model/provider.dart';
import 'package:universal_lab/class/user_services/auth_service.dart';

import '../../api/api_urls.dart';
import 'order/order_model.dart';
import 'product_master/brand_model.dart';
import 'product_master/items_model.dart';
import 'product_master/marquee_master.dart';
import 'product_master/shipping_model.dart';

class HttpServices {
  static late BuildContext _context;
  static void initialize(BuildContext context) => _context = context;

  Future getCategory() async {
    Uri url = Uri.parse("$fetchTable$params1=category_master");
    log("$url");
    try {
      await http.get(url).then((value) {
        if (value.statusCode == 200) {
          log(value.body);
          var jsonData = jsonDecode(value.body);
          _context.read<Provide>().category = categoriesFromJson(jsonData);
        }
      });
    } catch (e) {
      log("api calling fails for getting category");
      log(e.toString());
    }
  }

  Future getBrand() async {
    Uri url = Uri.parse("$fetchTable$params1=subcategory_master");
    log("$url");
    try {
      await http.get(url).then((value) {
        if (value.statusCode == 200) {
          log(value.body);
          var jsonData = jsonDecode(value.body);
          // log(jsonData.toString());
          _context.read<Provide>().brands = brandsFromJson(jsonData);
        }
      });
    } catch (e) {
      log("api calling fails for getting brands");
      log(e.toString());
    }
  }

  Future<bool> getItem() async {
    Uri url = Uri.parse("$fetchTable$params1=menu_master");
    log("$url");
    try {
      return await http.get(url).then((value) {
        if (value.statusCode == 200) {
          log(value.body);
          var jsonData = jsonDecode(value.body);
          _context.read<Provide>().items = itemsFromJson(jsonData);
          return true;
        }
        return false;
      });
    } catch (e) {
      log("api calling fails for getting items");
      log(e.toString());
      return false;
    }
  }

  Future getMarquee() async {
    Uri url = Uri.parse("$fetchTable$params1=marquee_master");
    log("$url");
    try {
      return await http.get(url).then((value) {
        if (value.statusCode == 200) {
          log(value.body);
          var jsonData = jsonDecode(value.body);
          return _context.read<Provide>().marquee = marqueeFromJson(jsonData);
        }
      });
    } catch (e) {
      log("api calling fails for getting marquee");
      log(e.toString());
    }
  }

  Future getShippingCharge() async {
    Uri url = Uri.parse("$fetchTable$params1=shipping_master");
    log("$url");
    try {
      return await http.get(url).then((value) {
        if (value.statusCode == 200) {
          log(value.body);
          var jsonData = jsonDecode(value.body);
          return _context.read<Provide>().shippingCharges =
              shippingFromJson(jsonData);
        }
      });
    } catch (e) {
      log("api calling fails for getting marquee");
      log(e.toString());
    }
  }

  Future getUserOrders() async {
    Uri url = Uri.parse(getUserOrdersApi);
    log("$url");
    try {
      return await http.post(url, body: {
        'user_id': _context.read<AuthService>().userModel.id
      }).then((value) {
        if (value.statusCode == 200) {
          log(value.body);
          var jsonData = jsonDecode(value.body);
          return _context.read<Provide>().currentOrder =
              currentOrderFromJson(jsonData);
        }
      });
    } catch (e) {
      log("api calling fails for getting marquee");
      log(e.toString());
    }
  }

  Future<Map?> getMoreProductDetails(ItemModel item) async {
    Uri url = Uri.parse(getProductMoreDetails);
    log("$url");
    try {
   return    await http.post(url, body: {'pro_id': item.id}).then((value) {
        if (value.statusCode == 200) {
          log(value.body);
          Map jsonData = jsonDecode(value.body);
          return jsonData;
        }
        return  null;
      });
    } catch (e) {
      log("api calling fails for getting more product details ");
      log(e.toString());
      return null;
    }
  }
}
