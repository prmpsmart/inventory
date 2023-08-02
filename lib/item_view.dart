import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory/theme.dart';
import './app_text.dart';
import './inventory.dart';
import './item.dart';

class ItemView extends StatefulWidget {
  final Inventory inventory;
  const ItemView(this.inventory, {super.key});

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  void initState() {
    widget.inventory.changed.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.r),
      decoration: BoxDecoration(
        color: AppColorPallete.red.withOpacity(.15),
        borderRadius: BorderRadius.circular(5.r),
      ),
      height: 40.h,
      child: MaterialButton(
        padding: EdgeInsets.all(5.r),
        onPressed: () => showItem(context, inventory: widget.inventory)
            .then((value) => setState(() {})),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColorPallete.white.withOpacity(.15),
              ),
              child: Icon(
                Icons.inventory,
                size: 35.r,
                color: AppColorPallete.green.withOpacity(.9),
              ),
            ),
            5.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  widget.inventory.name,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.spMin,
                ),
                20.horizontalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText('Quantity: ${widget.inventory.quantity}'),
                    10.horizontalSpace,
                    AppText('Cost Price: # ${widget.inventory.costPrice}'),
                    10.horizontalSpace,
                    AppText(
                        'Selling Price: # ${widget.inventory.sellingPrice}'),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
