import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library_book/Module/home/bloc/cubit/popular_cubit.dart';
import 'package:flutter_library_book/Module/home/widgets/list_book_component.dart';
import 'package:flutter_library_book/Module/home/widgets/popular_books_component.dart';
import 'package:flutter_library_book/Module/search/view/search_view.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController scrollController;
  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    context.read<PopularCubit>().getBooks(
        client: http.Client(), page: context.read<PopularCubit>().pageIndex);
    scrollController.addListener(() {
      if ((scrollController.position.pixels ==
          scrollController.position.maxScrollExtent)) {
        setState(() {
          context.read<PopularCubit>().pageIndex += 1;
          context.read<PopularCubit>().getDataBook(
              client: http.Client(),
              page: context.read<PopularCubit>().pageIndex);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SearchView()));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: ListView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          children: [PopularBooksComponent(), ListBookComponet()],
        ));
  }
}
