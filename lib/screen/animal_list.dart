import 'package:flutter/material.dart';
import 'package:mysql_api/model/post_model.dart';
import 'package:mysql_api/repository/post_repository.dart';
import 'package:mysql_api/screen/post_page.dart';

class AnimalListPage extends StatelessWidget {
  final animalRepository = AnimalRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PostPage(),
                  ),
                );
              },
              icon: const Icon(Icons.add))
        ],
        title: Text('Animal List'),
      ),
      body: FutureBuilder<List<Animal>>(
        future: animalRepository.fetchAnimals(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name),
                  subtitle: Text('ID: ${snapshot.data![index].id}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
