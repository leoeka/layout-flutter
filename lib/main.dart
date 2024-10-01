import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter Layout Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0), // Tambahkan padding di sini
            child: Column(
              children: [
                // Menambahkan gambar
                ImageSection(image: 'assets/gambar-pemandangan-pinggir-pantai.jpg'), // Pastikan gambar ada di folder assets
                // TitleSection pertama
                TitleSection(
                  name: 'Pelabuhan Ujung',
                  location: 'Muncar',
                ),
                // TitleSection kedua
                TitleSection(
                  name: 'Pantai BOOM',
                  location: 'Banyuwangi',
                ),
                Center(
                  child: Text('Hello World'),
                ),
                // Menambahkan ButtonSection
                ButtonSection(),
                // Menambahkan TextSection
                TextSection(
                  description: 'Pantai BOOM adalah salah satu pantai di Banyuwangi yang menawarkan pemandangan indah dan suasana yang menenangkan.',
                ),
                // Menambahkan TitleSection dan ButtonSection tambahan
                TitleSection(
                  name: 'Pantai Cemara Kawang',
                  location: 'Kawang, Muncar',
                ),
                ButtonSection(),
                // TextSection untuk Pantai Cemara
                TextSection(
                  description:
                      'Pantai Cemara adalah salah satu destinasi wisata di Banyuwangi yang terkenal dengan suasana yang sejuk dan asri. '
                      'Pantai ini dikelilingi oleh deretan pohon cemara yang tumbuh di sepanjang garis pantainya, memberikan nuansa alami dan teduh. '
                      'Selain pemandangan laut yang indah, pengunjung juga dapat menikmati aktivitas seperti bersepeda atau sekadar bersantai di bawah rindangnya pohon cemara. '
                      'Pantai ini cocok untuk mereka yang mencari ketenangan dan keindahan alam di tepi laut.',
                ),
                // Menambahkan gambar baru
                ImageSection(
                  image: 'assets/lake.jpg', // Ganti dengan jalur gambar yang sesuai
                ),
                TitleSection(
                  name: 'Oeschinen Lake Campground',
                  location: 'Kandersteg, Switzerland',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget untuk TitleSection
class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 90, 235, 83),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Color.fromARGB(255, 54, 244, 76),
          ),
          const Text('41'),
        ],
      ),
    );
  }
}

// Widget untuk ButtonSection
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

// Widget untuk ButtonWithText
class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

// Widget untuk TextSection
class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

// Widget untuk ImageSection
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity, // Memperbaiki agar gambar memenuhi lebar layar
      height: 240,
      fit: BoxFit.cover,
    );
  }
}
