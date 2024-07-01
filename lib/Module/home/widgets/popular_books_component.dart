import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library_book/Core/Model/book_model.dart';
import 'package:flutter_library_book/Module/home/bloc/cubit/home_cubit.dart';
import 'package:flutter_library_book/Module/home/widgets/book_card_component.dart';
import 'package:http/http.dart' as http;
import 'package:skeletonizer/skeletonizer.dart';

class PopularBooksComponent extends StatefulWidget {
  const PopularBooksComponent({super.key});

  @override
  State<PopularBooksComponent> createState() => _PopularBooksComponentState();
}

class _PopularBooksComponentState extends State<PopularBooksComponent> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeCubit>().getBooks(
        client: http.Client(), page: context.read<HomeCubit>().pageIndex);
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
                "Popular Book",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Spacer()
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
              height: 256,
              child:
                  BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                print("Popular state $state");
                if (state is LoadingHomeState) {
                  return Skeletonizer(
                    enabled: true,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return BookCardComponent(
                            bookModel: BookModel(
                                id: index,
                                title: "Title product",
                                authors: [
                                  Author(
                                      name: "",
                                      birthYear: 1000,
                                      deathYear: 1000)
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
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return BookCardComponent(
                                bookModel: data[index],
                              );
                            });
                      });
                } else {
                  return Container();
                }
              })),
        ],
      ),
    );
  }
}
