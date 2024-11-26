import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import '../components/footer.dart'; // Ensure this is correctly imported

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C2939), // AppBar background color
        title: const Text('Gallery', style: TextStyle(fontSize: 24)),
      ),
      body: Column(
        children: [
          // Main Image inside a centered Card
          GestureDetector(
            onTap: () {
              // Navigate to the gallery folder when tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GalleryFolderPage()),
              );
            },
            child: Center(
              child: Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Smaller centered image
                      Container(
                        height:
                            200, // Adjust the height as needed for smaller image
                        width:
                            300, // Fixed width for the card to make it smaller
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/image1.jpg'), // Main image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Tap on the image to explore more galleries',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Folder Images (Grid)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Summit',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class GalleryFolderPage extends StatelessWidget {
  const GalleryFolderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C2939),
        title: const Text('Gallery Folders', style: TextStyle(fontSize: 24)),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Three folders per row
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 3, // Number of folders
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // When tapped, show images in that folder
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FolderImagesPage(folderIndex: index),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  // Folder image
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/folder$index.jpg', // Replace with your folder image path
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Folder name (Update the folder names)
                  Text(
                    index == 0
                        ? 'Summit'
                        : index == 1
                            ? 'Sessions'
                            : 'Hackathon',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FolderImagesPage extends StatefulWidget {
  final int folderIndex;
  const FolderImagesPage({super.key, required this.folderIndex});

  @override
  _FolderImagesPageState createState() => _FolderImagesPageState();
}

class _FolderImagesPageState extends State<FolderImagesPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _swingAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _swingAnimation = Tween<Offset>(
            begin: const Offset(-0.1, 0), end: const Offset(0.1, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/folder${widget.folderIndex}/image1.jpg',
      'assets/images/folder${widget.folderIndex}/image2.jpg',
      'assets/images/folder${widget.folderIndex}/image3.jpg',
      'assets/images/folder${widget.folderIndex}/image1.jpg',
      'assets/images/folder${widget.folderIndex}/image2.jpg',
      'assets/images/folder${widget.folderIndex}/image3.jpg',
      'assets/images/folder${widget.folderIndex}/image1.jpg',
      'assets/images/folder${widget.folderIndex}/image2.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C2939),
        title: const Text('Folder Images', style: TextStyle(fontSize: 24)),
      ),
      body: Column(
        children: [
          // Grid of images
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Four images per row
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return SlideTransition(
                  position: _swingAnimation,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        images[index], // Replace with the images of the folder
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Footer widget
          const Footer(), // Footer is placed here
        ],
      ),
    );
  }
}
