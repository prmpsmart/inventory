import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory/app_text.dart';
import './theme.dart';
import './app_text_field.dart';
import './inventory.dart';
import './db.dart';

class Item extends StatefulWidget {
  final Inventory? inventory;
  const Item({this.inventory, super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  late final TextEditingController _nameC;
  late final TextEditingController _quantityC;
  late final TextEditingController _costPriceC;
  late final TextEditingController _sellingPriceC;
  late final TextEditingController _descriptionC;

  late final FocusNode _nameF;
  late final FocusNode _quantityF;
  late final FocusNode _costPriceF;
  late final FocusNode _sellingPriceF;
  late final FocusNode _descriptionF;

  @override
  void initState() {
    _nameC = TextEditingController();
    _quantityC = TextEditingController();
    _costPriceC = TextEditingController();
    _sellingPriceC = TextEditingController();
    _descriptionC = TextEditingController();

    _nameF = FocusNode();
    _quantityF = FocusNode();
    _costPriceF = FocusNode();
    _sellingPriceF = FocusNode();
    _descriptionF = FocusNode();

    if (widget.inventory != null) {
      _nameC.value = TextEditingValue(text: widget.inventory!.name);
      _quantityC.value = TextEditingValue(
        text: '${widget.inventory!.quantity}',
      );
      _costPriceC.value = TextEditingValue(
        text: '${widget.inventory!.costPrice}',
      );
      _sellingPriceC.value = TextEditingValue(
        text: '${widget.inventory!.sellingPrice}',
      );
      _descriptionC.value =
          TextEditingValue(text: widget.inventory!.description);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var image = Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColorPallete.black.withOpacity(.15),
      ),
      child: MaterialButton(
        padding: EdgeInsets.all(5.r),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Stack(
          children: [
            Icon(
              Icons.inventory,
              size: .35.sw,
              color: AppColorPallete.green.withOpacity(.9),
            ),
            Positioned(
              bottom: 1.w,
              right: 1.w,
              child: const Icon(
                Icons.edit_square,
                color: AppColorPallete.white,
              ),
            )
          ],
        ),
      ),
    );

    return Dialog(
      elevation: 30,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColorPallete.red.withOpacity(.15),
          borderRadius: BorderRadius.circular(5.r),
        ),
        // height: .7.sh,
        padding: EdgeInsets.all(5.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              labelText: 'Name',
              hintText: 'Enter item name ...',
              focusNode: _nameF,
              controller: _nameC,
            ),
            Row(
              children: [
                image,
                5.horizontalSpace,
                Column(
                  children: [
                    AppTextField(
                      labelText: 'Quantity',
                      hintText: 'Item quantity ...',
                      focusNode: _quantityF,
                      controller: _quantityC,
                      hintSize: 12,
                      width: .4.sw,
                      textInputType: TextInputType.number,
                    ),
                    AppTextField(
                      labelText: 'Cost Price',
                      hintText: 'Item cost price ...',
                      focusNode: _costPriceF,
                      controller: _costPriceC,
                      hintSize: 12,
                      width: .4.sw,
                      textInputType: TextInputType.number,
                    ),
                    AppTextField(
                      labelText: 'Selling Price',
                      hintText: 'Item selling price ...',
                      focusNode: _sellingPriceF,
                      controller: _sellingPriceC,
                      hintSize: 12,
                      width: .4.sw,
                      textInputType: TextInputType.number,
                    ),
                  ],
                )
              ],
            ),
            5.verticalSpace,
            AppTextField(
              labelText: 'Description',
              hintText: 'Enter item description ...',
              focusNode: _descriptionF,
              controller: _descriptionC,
              maxLines: 10,
              fontSize: 12,
            ),
            MaterialButton(
              onPressed: () {
                if (saveInventory()) {
                  Navigator.pop(context);
                }
              },
              elevation: 2,
              minWidth: .5.sw,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
              color: AppColorPallete.primary,
              child: AppText(
                'Save',
                fontSize: 16.sp,
              ),
            )
          ],
        ),
      ),
    );
  }

  bool saveInventory() {
    var name = _nameC.text;
    if (name.isNotEmpty) {
      var inventory = widget.inventory ?? Inventory();
      inventory.name = name;
      inventory.quantity = int.tryParse(_quantityC.text) ?? 0;
      inventory.costPrice = double.tryParse(_costPriceC.text) ?? 0;
      inventory.sellingPrice = double.tryParse(_sellingPriceC.text) ?? 0;
      inventory.description = _descriptionC.text;
      return DataBase.saveInventory(inventory);
    }
    return false;
  }

  @override
  void dispose() {
    _nameC.dispose();
    _quantityC.dispose();
    _costPriceC.dispose();
    _sellingPriceC.dispose();
    _descriptionC.dispose();

    _nameF.dispose();
    _quantityF.dispose();
    _costPriceF.dispose();
    _sellingPriceF.dispose();
    _descriptionF.dispose();
    super.dispose();
  }
}

Future showItem(BuildContext context, {Inventory? inventory}) {
  return showDialog(
    context: context,
    builder: (context) => Item(inventory: inventory),
  );
}
