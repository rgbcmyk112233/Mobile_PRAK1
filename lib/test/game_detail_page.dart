import 'package:flutter/material.dart';
import 'package:olah_data/test/game_store_model.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetailPage extends StatelessWidget {
  final GameStore game;
  const GameDetailPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(game.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // gambar utama
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(game.imageUrls[0]),
            ),
            SizedBox(height: 12),
            // nama + harga
            Text(
              game.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              game.price,
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 8),
            // review
            Text(
              "Rating: ${game.reviewAverage} (${game.reviewCount} reviews)",
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            // tentang game
            Text(
              "About",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(game.about),
            SizedBox(height: 16),
            // tag
            Wrap(
              spacing: 8,
              children: game.tags
                  .map(
                    (tag) => Chip(
                      label: Text(tag),
                      backgroundColor: Colors.blue.shade100,
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16),
            // tombol ke store
            ElevatedButton(
              onPressed: () async {
                final Uri url = Uri.parse(game.linkStore);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Tidak bisa membuka link")),
                  );
                }
              },
              child: Text("View on Steam"),
            ),
          ],
        ),
      ),
    );
  }
}
