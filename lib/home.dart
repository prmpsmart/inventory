import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './theme.dart';
import './item_view.dart';
import './inventory.dart';
import './app_text_field.dart';
import './item.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final TextEditingController _searchItemC;
  late final FocusNode _searchItemF;

  List<Inventory> inventories = [];

  @override
  void initState() {
    _searchItemC = TextEditingController();
    _searchItemF = FocusNode();

    super.initState();

    for (int i = 0; i < 10; i++) {
      inventories.add(
        Inventory(
          name: 'Inventory Name $i',
          quantity: 4,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Inventory> items = [];
    for (var item in inventories) {
      if (validInventory(item)) items.add(item);
    }

    return GestureDetector(
      onTap: () => _searchItemF.unfocus(),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColorPallete.primary,
            foregroundColor: AppColorPallete.white,
            elevation: 5,
            title: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Karla',
              ),
            ),
            leading: const Icon(Icons.inventory_2_outlined)),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextField(
                    hintText: 'Enter anything about an item to search it...',
                    labelText: 'Search Item :',
                    controller: _searchItemC,
                    focusNode: _searchItemF,
                    onChanged: (value) {
                      setState(() {});
                    }),
                5.verticalSpace,
                if (items.isEmpty) const Spacer(),
                if (items.isNotEmpty)
                  Expanded(
                      child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      var inventory = items[index];
                      return validInventory(inventory)
                          ? ItemView(inventory)
                          : null;
                    },
                  )),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColorPallete.primary,
          onPressed: () {
            showItem(context).then((value) => setState(() {}));
          },
          tooltip: 'New Item',
          child: const Icon(Icons.add_shopping_cart),
        ),
      ),
    );
  }

  bool validInventory(Inventory inventory) {
    String search = _searchItemC.text.toLowerCase();
    if (search.isEmpty) return true;
    String contents =
        '${inventory.name.toLowerCase()}${inventory.description.toLowerCase()}${inventory.costPrice}${inventory.sellingPrice}${inventory.quantity}';
    return contents.contains(search);
  }

  @override
  void dispose() {
    _searchItemC.dispose();
    super.dispose();
  }
}
