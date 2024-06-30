import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library_book/Core/Model/book_model.dart';
import 'package:flutter_library_book/Module/home/bloc/cubit/popular_cubit.dart';
import 'package:flutter_library_book/Module/home/widgets/book_horizontal_component.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:http/http.dart' as http;

class ListBookComponet extends StatefulWidget {
  const ListBookComponet({super.key});

  @override
  State<ListBookComponet> createState() => _ListBookComponetState();
}

class _ListBookComponetState extends State<ListBookComponet> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "English",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Spacer()
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          BlocBuilder<PopularCubit, PopularState>(builder: (context, state) {
            if (state is LoadingPopularState) {
              return Skeletonizer(
                enabled: true,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return BookHorizontalComponent(
                        bookModel: BookModel(
                            id: index,
                            title: "Title product",
                            authors: [
                              Author(name: "", birthYear: 1000, deathYear: 1000)
                            ],
                            translators: [],
                            subjects: [],
                            bookshelves: [],
                            languages: [],
                            copyright: true,
                            mediaType: "",
                            formats: Formats(
                                textHtml: "",
                                applicationEpubZip: "",
                                applicationXMobipocketEbook: "",
                                applicationRdfXml: "",
                                imageJpeg:
                                    "https://www.gutenberg.org/cache/epub/2701/pg2701.cover.medium.jpg",
                                textPlainCharsetUsAscii: "",
                                applicationOctetStream: ""),
                            downloadCount: 1002),
                      );
                    }),
              );
            } else if (state is GetSuccessBookHomeState) {
              return StreamBuilder(
                  stream: state.stream,
                  builder: (context, snapshoot) {
                    var data = snapshoot.data ?? [];
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return BookHorizontalComponent(
                              bookModel: data[index]);
                        });
                  });
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
