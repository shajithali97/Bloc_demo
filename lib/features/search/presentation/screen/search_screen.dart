import 'package:bloc_login_demo/core/constants/app_color.dart';
import 'package:bloc_login_demo/features/search/domain/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchEditingController;
  late SpeechToText speechToText;
  bool _isListening = false;
  bool _isLoad = true;
  var productModel;

  @override
  void initState() {
    speechToText = SpeechToText();
    searchEditingController = TextEditingController();
    loadData();
    super.initState();
  }

  loadData() async {
    productModel = await SearchRepository().fetchProductList();

    setState(() {
      productModel;
      _isLoad = false;
    });
  }

  @override
  void dispose() {
    searchEditingController.dispose();
    super.dispose();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await speechToText.initialize(
        onStatus: (val) {
          if (val == "done") {}
        },
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        speechToText.listen(
          onResult: (val) => setState(() {
            searchEditingController.text = val.recognizedWords;
            // _text = val.recognizedWords;
            // if (val.hasConfidenceRating && val.confidence > 0) {
            //   _confidence = val.confidence;
            // }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      speechToText.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () => _listen(), icon: const Icon(Icons.mic))
          ],
          title: TextFormField(
            controller: searchEditingController,
            decoration: const InputDecoration(
              hintText: "Search Products",
            ),
          ),
        ),
        body: _isLoad
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: productModel.length,
                itemBuilder: (context, index) {
                  return productModel[index]["title"]
                          .toString()
                          .toLowerCase()
                          .contains(searchEditingController.text)
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ColoredBox(
                            color: AppColor.defaultCard,
                            child: ListTile(
                                title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productModel[index]["title"],
                                ),
                                Text(
                                  productModel[index]["price"].toString(),
                                )
                              ],
                            )),
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
      ),
    );
  }
}
