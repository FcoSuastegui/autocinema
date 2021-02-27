import 'package:autocinema/app/themes/adapt.dart';
import 'package:autocinema/app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumericStepButton extends StatelessWidget {
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onChanged;
  final Color iconButtonColor;
  final double iconSize, splashRadius;
  final TextStyle textStyle;
  final MainAxisAlignment mainAxisAlignment;
  final Text title;

  const NumericStepButton(
      {Key key,
      this.minValue = 1,
      this.maxValue = 10,
      @required this.onChanged,
      this.iconButtonColor,
      this.iconSize = 32.0,
      this.textStyle,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
      this.splashRadius = 20,
      @required this.title})
      : assert(onChanged != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NumericStepButtonController>(
      tag: UniqueKey().toString(),
      init: NumericStepButtonController(
        maxValue: maxValue,
        minValue: minValue,
      ),
      builder: (c) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: title,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  GestureDetector(
                    onTap: () {
                      c.decrement();
                      onChanged(c.counter);
                    },
                    child: Container(
                      color: c.counter != c.minValue
                          ? AppTheme.kPrimaryColor
                          : Theme.of(context).disabledColor,
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                  ),
                  Text(
                    '${c.counter}',
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      c.increment();
                      onChanged(c.counter);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: c.counter != c.maxValue
                            ? AppTheme.kPrimaryColor
                            : Theme.of(context).disabledColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Adapt.px(10)),
                        ),
                      ),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumericStepButtonController extends GetxController {
  RxInt _counter = 0.obs;
  int get counter => _counter.value;
  set counter(int counter) => _counter(counter);

  final int maxValue, minValue;

  NumericStepButtonController({
    this.minValue = 1,
    this.maxValue = 10,
  }) {
    _counter(minValue);
  }

  increment() => _counter < maxValue ? _counter++ : null;
  decrement() => _counter > minValue ? _counter-- : null;
}
