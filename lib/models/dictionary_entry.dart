import 'dart:convert';

String dictionaryEntryToJson(List<DictionaryEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DictionaryEntry {
  String entryWord;
  String headWord;
  List<Definition> definitions;
  List<String> partsOfSpeech;
  Synonym? synonym;
  List<VerbMorphologyEntry>? verbMorphologyEntries;
  List<Quote>? quotes;
  List<dynamic>? phonetics;

  DictionaryEntry({
    required this.entryWord,
    required this.headWord,
    required this.definitions,
    required this.partsOfSpeech,
    this.synonym,
    this.verbMorphologyEntries,
    this.quotes,
    this.phonetics,
  });

  factory DictionaryEntry.fromJson(
    Map<String, dynamic> json,
  ) => DictionaryEntry(
    entryWord: json["entryWord"],
    headWord: json["headWord"],
    definitions:
        json["definitions"] == null
            ? []
            : List<Definition>.from(
              json["definitions"]!.map((x) => Definition.fromJson(x)),
            ),
    partsOfSpeech:
        json["partsOfSpeech"] == null
            ? []
            : List<String>.from(json["partsOfSpeech"]!.map((x) => x)),
    synonym: json["synonym"] == null ? null : Synonym.fromJson(json["synonym"]),
    verbMorphologyEntries:
        json["verbMorphologyEntries"] == null
            ? []
            : List<VerbMorphologyEntry>.from(
              json["verbMorphologyEntries"]!.map(
                (x) => VerbMorphologyEntry.fromJson(x),
              ),
            ),
    quotes:
        json["quotes"] == null
            ? []
            : List<Quote>.from(json["quotes"]!.map((x) => Quote.fromJson(x))),
    phonetics:
        json["phonetics"] == null
            ? []
            : List<dynamic>.from(json["phonetics"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "entryWord": entryWord,
    "headWord": headWord,
    "definitions":
        definitions == null
            ? []
            : List<dynamic>.from(definitions!.map((x) => x.toJson())),
    "partsOfSpeech":
        partsOfSpeech == null
            ? []
            : List<dynamic>.from(partsOfSpeech!.map((x) => x)),
    "synonym": synonym?.toJson(),
    "verbMorphologyEntries":
        verbMorphologyEntries == null
            ? []
            : List<dynamic>.from(verbMorphologyEntries!.map((x) => x.toJson())),
    "quotes":
        quotes == null
            ? []
            : List<dynamic>.from(quotes!.map((x) => x.toJson())),
    "phonetics":
        phonetics == null ? [] : List<dynamic>.from(phonetics!.map((x) => x)),
  };
}

class Definition {
  String? definition;
  String? source;
  dynamic mark;

  Definition({this.definition, this.source, this.mark});

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
    definition: json["definition"],
    source: json["source"],
    mark: json["mark"],
  );

  Map<String, dynamic> toJson() => {
    "definition": definition,
    "source": source,
    "mark": mark,
  };
}

class Quote {
  String? text;
  String? author;
  String? source;

  Quote({this.text, this.author, this.source});

  factory Quote.fromJson(Map<String, dynamic> json) =>
      Quote(text: json["text"], author: json["author"], source: json["source"]);

  Map<String, dynamic> toJson() => {
    "text": text,
    "author": author,
    "source": source,
  };
}

class Synonym {
  List<String>? synonymList;
  String? source;

  Synonym({this.synonymList, this.source});

  factory Synonym.fromJson(Map<String, dynamic> json) => Synonym(
    synonymList:
        json["synonymList"] == null
            ? []
            : List<String>.from(json["synonymList"]!.map((x) => x)),
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "synonymList":
        synonymList == null
            ? []
            : List<dynamic>.from(synonymList!.map((x) => x)),
    "source": source,
  };
}

class VerbMorphologyEntry {
  List<String>? partsOfSpeech;
  String? conjugatedForm;

  VerbMorphologyEntry({this.partsOfSpeech, this.conjugatedForm});

  factory VerbMorphologyEntry.fromJson(Map<String, dynamic> json) =>
      VerbMorphologyEntry(
        partsOfSpeech:
            json["partsOfSpeech"] == null
                ? []
                : List<String>.from(json["partsOfSpeech"]!.map((x) => x)),
        conjugatedForm: json["conjugatedForm"],
      );

  Map<String, dynamic> toJson() => {
    "partsOfSpeech":
        partsOfSpeech == null
            ? []
            : List<dynamic>.from(partsOfSpeech!.map((x) => x)),
    "conjugatedForm": conjugatedForm,
  };
}
