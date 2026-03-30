import 'package:bitenow/services/supaservice.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> favList = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

 Future<void> loadFavorites() async {
  final user = supabase.auth.currentUser;
  if (user == null) return;

  final favData = await supabase
      .from('favorites')
      .select()
      .eq('user_id', user.id);

  setState(() {
    favList = List<Map<String, dynamic>>.from(favData);
  });
}
Future<List<Map<String, dynamic>>> getFavorites() async {
  final user = supabase.auth.currentUser;
  if (user == null) return [];

  final data = await supabase
      .from('favorites')
      .select()
      .eq('user_id', user.id);

  return List<Map<String, dynamic>>.from(data);
}
  Future<void> removeFavorite(int itemId) async {
    await SupabaseService().removeFromFavorites(itemId);
    loadFavorites(); // Refresh list after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Favorites"), backgroundColor: Colors.deepOrange),
      body: favList.isEmpty
          ? const Center(child: Text("No Favorites Yet ❤️"))
          : ListView.builder(
            
              itemCount: favList.length,
              itemBuilder: (context, index) {
                final item = favList[index];
                return ListTile(
  leading: Image.network(item['image_url'], width: 50),
  title: Text(item['item_name']),
  subtitle: Text("₹${item['food_price']}"),
  trailing: IconButton(
    icon: const Icon(Icons.favorite, color: Colors.red),
    onPressed: () => removeFavorite(item['item_id']),
  ),
);
              },
            ),
    );
  }
}