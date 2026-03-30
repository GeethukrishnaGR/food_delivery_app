import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderProvider extends ChangeNotifier {
  String selectedTab = "Active";

  List<Map<String, dynamic>> activeOrders = [];
  List<Map<String, dynamic>> completedOrders = [];
  List<Map<String, dynamic>> cancelledOrders = [];

  final supabase = Supabase.instance.client;

  /// 🔥 LOAD DATA BASED ON TAB
  Future<void> loadOrders(String tab) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    selectedTab = tab;

    if (tab == "Active") {
      final data = await supabase
          .from('cart') // 🔥 cart table
          .select()
          .eq('user_id', user.id);

      activeOrders = List<Map<String, dynamic>>.from(data);
    }

    else if (tab == "Completed") {
      final data = await supabase
          .from('orders')
          .select()
          .eq('user_id', user.id)
          .eq('status', 'completed');

      completedOrders = List<Map<String, dynamic>>.from(data);
    }

    else if (tab == "Cancelled") {
      final data = await supabase
          .from('orders')
          .select()
          .eq('user_id', user.id)
          .eq('status', 'cancelled');

      cancelledOrders = List<Map<String, dynamic>>.from(data);
    }

    notifyListeners();
  }

  List<Map<String, dynamic>> get currentList {
    if (selectedTab == "Active") return activeOrders;
    if (selectedTab == "Completed") return completedOrders;
    return cancelledOrders;
  }

  void changeTab(String title) {}

  Future<void> updateOrderStatus(String label) async {}
}
