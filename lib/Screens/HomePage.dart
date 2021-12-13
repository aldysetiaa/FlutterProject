import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../CustomWidgets/Product.dart';
import '../Controllers/ProductController.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key?  key}) : super (key: key);
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  final ProductController pc = Get.put(ProductController());
  bool? clickedCentreFAB = false;
  int? selectedIndex = 0;
  String? text;
  int? _selectedIndex;

  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JubelioPOS", style: TextStyle(
            fontWeight: FontWeight.w700, color: Colors.black87),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Ionicons.chevron_back_outline, color: Colors.black87,),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => print('Tap Tap'),
              icon: const Icon(Ionicons.filter_outline, color: Colors.black87,)),
        ],

      ),
      body: Column(
        children: [

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
                right: 10.0, left: 10.0, top: 3, bottom: 3),

            child: Row(
              children: List.generate(pc.CtgrChoice.length, (index) {
                return ChoiceChip(
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black87,

                      )),
                  selected: _selectedIndex == index,
                  label: Text(pc.CtgrChoice[index]),
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }
                  },
                  labelStyle: const TextStyle(color: Colors.black87,
                      decorationColor: Colors.black87,
                      fontWeight: FontWeight.w400),
                );
              },
              ),
            ),
          ),
          Expanded(
            child: Obx(
                  () {
                if (pc.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: pc.productList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return  ProductTile(pc.productList[index]);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  );
              },
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => print('Basket'),
        child: Stack(
          children:  <Widget>[
           const Icon(Ionicons.bag_handle_outline, color: Colors.black87,),
            const  Positioned( // draw a red marble
              top: 0.0,
              right: 0.0,
              child: const  Icon(Icons.brightness_1, size: 8.0,
                  color: Colors.redAccent),
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        elevation: 10.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  updateTabSelection(0, "Home");
                },
                iconSize: 27.0,
                icon: Icon(
                  Ionicons.grid_outline,
                  //darken the icon if it is selected or else give it a different color
                  color: selectedIndex == 0
                      ? Colors.black87
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1, "Outgoing");
                },
                iconSize: 27.0,
                icon: Icon(
                  Ionicons.search_outline,
                  color: selectedIndex == 1
                      ? Colors.black87
                      : Colors.grey.shade400,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
            const   SizedBox(
                width: 10.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(2, "Incoming");
                },
                iconSize: 27.0,
                icon: Icon(
                  Ionicons.bookmark_outline,
                  color: selectedIndex == 2
                      ? Colors.black87
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3, "Settings");
                },
                iconSize: 27.0,
                icon: Icon(
                  Ionicons.person_outline,
                  color: selectedIndex == 3
                      ? Colors.black87
                      : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        //color of the BottomAppBar
        color: Colors.white,
      ),
    );
  }
}