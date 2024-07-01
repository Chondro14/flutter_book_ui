import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library_book/Core/Model/book_model.dart';
import 'package:flutter_library_book/Core/widget/book_horizontal_component.dart';
import 'package:flutter_library_book/Module/search/bloc/cubit/search_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:http/http.dart' as http;

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late ScrollController scrollController;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    scrollController.addListener(() {
      if ((scrollController.position.pixels ==
          scrollController.position.maxScrollExtent)) {
        setState(() {
          context.read<SearchCubit>().pageIndex += 1;
          context
              .read<SearchCubit>()
              .getDataBook(client: http.Client(), query: searchController.text);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(100))),
          controller: searchController,
          onSubmitted: (value) {
            context
                .read<SearchCubit>()
                .getBooks(client: http.Client(), query: value);
          },
        ),
        bottom: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            context.read<SearchCubit>().pageIndex = 1;
            context
                .read<SearchCubit>()
                .getBooks(client: http.Client(), query: searchController.text);
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is LoadingSearchState) {
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
                                Author(
                                    name: "", birthYear: 1000, deathYear: 1000)
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
              } else if (state is GetStreamSearchBookState) {
                return StreamBuilder(
                    stream: state.stream,
                    builder: (context, snapshoot) {
                      var data = snapshoot.data ?? [];
                      return ListView.builder(
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
            },
          ),
        ),
      ),
    );
  }
}
