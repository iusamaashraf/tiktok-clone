import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String uid;
  const ProfileScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: const Icon(Icons.person_add_alt_1_outlined),
        actions: const [Icon(Icons.more_horiz)],
        centerTitle: true,
        title: const Text('username',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: '',
                        height: 100,
                        width: 100,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          '10',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Following',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Container(
                        height: 50,
                        color: Colors.black54,
                        width: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 15)),
                    Column(
                      children: [
                        const Text(
                          '10',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Followers',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Container(
                        height: 50,
                        color: Colors.black54,
                        width: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 15)),
                    Column(
                      children: [
                        const Text(
                          '10',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Likes',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  width: 140,
                  height: 47,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: const Text('Sign Out',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                //video list
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
