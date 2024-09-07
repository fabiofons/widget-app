import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    scrollController.addListener(() {
      // scrollController.position.pixels //posición actual
      // scrollController.position.maxScrollExtent // maximo scroll posible
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
    super.initState();
  }

  void moveScrollToBottom() {
    if((scrollController.position.pixels + 120) <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastEaseInToSlowEaseOut
    );
  }

  void addFiveIMages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future loadNextPage() async {
    if (isLoading) return;

    isLoading = true;

    await Future.delayed(const Duration(seconds: 2));
    addFiveIMages();

    isLoading = false;

    if (!isMounted) return;

    setState(() {});

    moveScrollToBottom();
  }

  Future onRefresh() async {
    isLoading = true;
    setState(() {});
    
    await Future.delayed(const Duration(seconds: 3));
    if(!isMounted) return;

    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    isLoading = false;
    addFiveIMages();

    setState(() {});
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 15,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              //NetworkImage
              return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          // child: const Icon(Icons.arrow_back_ios_new_rounded),
          child: isLoading
              ? SpinPerfect(
                  infinite: true, child: const Icon(Icons.refresh_rounded))
              : FadeIn(child: const Icon(Icons.arrow_back_ios_new_rounded))),
    );
  }
}
