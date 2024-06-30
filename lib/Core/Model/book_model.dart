class ResultGetBooksModel {
  List<BookModel> results;

  ResultGetBooksModel({
    required this.results,
  });

  factory ResultGetBooksModel.fromJson(List<dynamic> json) =>
      ResultGetBooksModel(
        results: List<BookModel>.from(json.map((x) => BookModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class BookModel {
  int id;
  String title;
  List<Author> authors;
  List<Author> translators;
  List<String> subjects;
  List<String> bookshelves;
  List<String> languages;
  bool copyright;
  String? mediaType;
  Formats formats;
  int downloadCount;
  bool? isFavorited;

  BookModel(
      {required this.id,
      required this.title,
      required this.authors,
      required this.translators,
      required this.subjects,
      required this.bookshelves,
      required this.languages,
      required this.copyright,
      required this.mediaType,
      required this.formats,
      required this.downloadCount,
      this.isFavorited = false});

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        title: json["title"],
        authors:
            List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        translators: List<Author>.from(
            json["translators"].map((x) => Author.fromJson(x))),
        subjects: List<String>.from(json["subjects"].map((x) => x)),
        bookshelves: List<String>.from(json["bookshelves"].map((x) => x)),
        languages: List<String>.from(json["languages"]),
        copyright: json["copyright"],
        mediaType: json["media_type"] ?? "",
        formats: Formats.fromJson(json["formats"]),
        downloadCount: json["download_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
        "translators": List<dynamic>.from(translators.map((x) => x.toJson())),
        "subjects": List<dynamic>.from(subjects.map((x) => x)),
        "bookshelves": List<dynamic>.from(bookshelves.map((x) => x)),
        "languages": List<dynamic>.from(languages),
        "copyright": copyright,
        "media_type": mediaType ?? "",
        "formats": formats.toJson(),
        "download_count": downloadCount,
      };
}

class Author {
  String name;
  int? birthYear;
  int? deathYear;

  Author({
    required this.name,
    required this.birthYear,
    required this.deathYear,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
        birthYear: json["birth_year"],
        deathYear: json["death_year"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "birth_year": birthYear,
        "death_year": deathYear,
      };
}

class Formats {
  String textHtml;
  String applicationEpubZip;
  String applicationXMobipocketEbook;
  String applicationRdfXml;
  String imageJpeg;
  String textPlainCharsetUsAscii;
  String applicationOctetStream;
  String? textHtmlCharsetUtf8;
  String? textPlainCharsetUtf8;
  String? textPlainCharsetIso88591;
  String? textHtmlCharsetIso88591;

  Formats({
    required this.textHtml,
    required this.applicationEpubZip,
    required this.applicationXMobipocketEbook,
    required this.applicationRdfXml,
    required this.imageJpeg,
    required this.textPlainCharsetUsAscii,
    required this.applicationOctetStream,
    this.textHtmlCharsetUtf8,
    this.textPlainCharsetUtf8,
    this.textPlainCharsetIso88591,
    this.textHtmlCharsetIso88591,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        textHtml: json["text/html"],
        applicationEpubZip: json["application/epub+zip"],
        applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
        applicationRdfXml: json["application/rdf+xml"],
        imageJpeg: json["image/jpeg"],
        textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"],
        applicationOctetStream: json["application/octet-stream"],
        textHtmlCharsetUtf8: json["text/html; charset=utf-8"],
        textPlainCharsetUtf8: json["text/plain; charset=utf-8"],
        textPlainCharsetIso88591: json["text/plain; charset=iso-8859-1"],
        textHtmlCharsetIso88591: json["text/html; charset=iso-8859-1"],
      );

  Map<String, dynamic> toJson() => {
        "text/html": textHtml,
        "application/epub+zip": applicationEpubZip,
        "application/x-mobipocket-ebook": applicationXMobipocketEbook,
        "application/rdf+xml": applicationRdfXml,
        "image/jpeg": imageJpeg,
        "text/plain; charset=us-ascii": textPlainCharsetUsAscii,
        "application/octet-stream": applicationOctetStream,
        "text/html; charset=utf-8": textHtmlCharsetUtf8,
        "text/plain; charset=utf-8": textPlainCharsetUtf8,
        "text/plain; charset=iso-8859-1": textPlainCharsetIso88591,
        "text/html; charset=iso-8859-1": textHtmlCharsetIso88591,
      };
}
