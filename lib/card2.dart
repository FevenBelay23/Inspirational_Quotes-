import 'package:flutter/material.dart';
import 'package:motivation/author.dart';
import 'package:motivation/authorsquote.dart';

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white54,
          title: Center(
            child: Text(
              'Choose an author',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: authorList.length,
            itemBuilder: (context, index) {
              Author author = authorList[index];
              return Card(
                child: ListTile(
                  title: Text(author.authorName),
                  subtitle: Text(author.title),
                  leading: CircleAvatar(
                    maxRadius: 32,
                    backgroundImage: NetworkImage(author.imageUrl),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        // print("add edit and some other things");
                      },
                      icon: Icon(Icons.more_vert)),
                  // Navigates to the detail page
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AuthorsQuote(author)));
                  },
                ),
              );
            }));
  }
}
