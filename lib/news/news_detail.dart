import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final String? name;
  final String? image;
  final String? title;
  final String? author;
  final DateTime? publishAt;
  final String? description;

  const NewsDetails(
      {Key? key,
      this.name,
      this.title,
      this.description,
      this.image,
      this.author,
      this.publishAt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name!)),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child: Hero(
                      tag: image!,
                      child: Image.network(image!, fit: BoxFit.fill))),
              Text(
                title!,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10.0),
              Text(
                description!,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 18.0,
                    ),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Author: ${author != null ? author! : 'No Author Found'}',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 18.0,
                    ),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Publish: $publishAt!',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 18.0,
                    ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
