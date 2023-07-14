import 'dart:math';

import 'package:flutter/material.dart';
import 'package:structure_project/utils/app_text_style.dart';
import 'package:structure_project/utils/base_color.dart';

class ConfigurableExpansionTile extends StatefulWidget {
  const ConfigurableExpansionTile({
    Key? key,
    required this.header,
    this.headerBackgroundColorStart = Colors.transparent,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.initiallyExpanded = false,
  }) : super(key: key);

  final Widget header;
  final Color headerBackgroundColorStart;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final bool initiallyExpanded;

  @override
  _ConfigurableExpansionTileState createState() => _ConfigurableExpansionTileState();
}

class _ConfigurableExpansionTileState extends State<ConfigurableExpansionTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeIn));
    _iconTurns = _controller.drive(Tween<double>(begin: 0.0, end: 0.5));

    _isExpanded = PageStorage.maybeOf(context)?.readState(context) as bool? ?? widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.maybeOf(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final Color headerColor = widget.headerBackgroundColorStart;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: _toggleExpansion,
          child: Container(
            color: headerColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: widget.header),
                  RotationTransition(
                    turns: _iconTurns,
                    child: const Icon(Icons.expand_more),
                  ),
                ],
              ),
            ),
          ),
        ),
        ClipRect(
          child: Align(
            heightFactor: _heightFactor.value,
            child: child,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed
          ? null
          : GestureDetector(
              onTap: _toggleExpansion,
              child: Container(
                child: Column(
                  children: widget.children,
                ),
              ),
            ),
    );
  }
}

class _ExpanstionDemoState extends StatefulWidget {
  const _ExpanstionDemoState({super.key});

  @override
  State<_ExpanstionDemoState> createState() => __ExpanstionDemoStateState();
}

class __ExpanstionDemoStateState extends State<_ExpanstionDemoState> {
  int? _key;
  _collapse() {
    int? newKey;
    do {
      _key = Random().nextInt(10000);
    } while (newKey == _key);
  }

  String selectedBusinessName = '';

  List<String> businessCategories = [
    " LocaleKeys.foodandBeverage",
    "LocaleKeys.healthandWellness",
    "LocaleKeys.hospitalityandTourism",
    "LocaleKeys.informationTechnology",
    "LocaleKeys.manufacturingandProduction",
    "LocaleKeys.marketingandAdvertising",
    "LocaleKeys.retailandEcommerce",
    "LocaleKeys.telecommunications",
    "LocaleKeys.transportationandLogistics",
    "LocaleKeys.wholesaleandDistribution",
    "LocaleKeys.otherBussines",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 4.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: ConfigurableExpansionTile(
          key: Key(_key.toString()),
          header: Text(
            selectedBusinessName == "" ? "LocaleKeys.enterBusinessCategories.tr" : selectedBusinessName.toString(),
            style: size16(fontColor: selectedBusinessName == "" ? Colors.black54 : blackColor),
          ),
          headerBackgroundColorStart: whiteColor,
          onExpansionChanged: ((value) {}),
          children: [
            SizedBox(
              height: 200,
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: businessCategories.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedBusinessName = businessCategories[index].toString();
                        });
                        _collapse();
                      },
                      child: Container(
                        color: whiteColor,
                        //  color: Colors.red,
                        height: 35,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5, left: 8, top: 5),
                              child: Text(
                                businessCategories[index].toString(),
                                style: size15(fontColor: blackColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
            ),
          ]),
    );
  }
}
