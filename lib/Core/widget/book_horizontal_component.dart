import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_book/Core/Model/book_model.dart';
import 'package:flutter_library_book/Core/widget/rating_bar.dart';

class BookHorizontalComponent extends StatelessWidget {
  final BookModel? bookModel;
  const BookHorizontalComponent({super.key, this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: bookModel?.formats.imageJpeg ?? "",
            width: 90,
            height: 120,
            errorWidget: (context, url, value) {
              return Icon(Icons.settings);
            },
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookModel?.title ?? "",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  bookModel!.authors.isEmpty
                      ? ""
                      : bookModel?.authors[0].name ?? "",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 12,
                ),
                const RatingBar(
                  score: 5.0,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          IconButton(
              onPressed: () {},
              icon: bookModel?.isFavorited == false
                  ? Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    )
                  : Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ))
        ],
      ),
    );
  }
}
