import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_book/Core/Model/book_model.dart';

class BookCardComponent extends StatelessWidget {
  final BookModel? bookModel;
  const BookCardComponent({super.key, this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: 180,
      height: 240,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: bookModel?.formats.imageJpeg ?? "",
            width: 120,
            height: 160,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            bookModel?.title ?? "",
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
