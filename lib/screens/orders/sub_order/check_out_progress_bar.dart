import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import 'package:universal_lab/class/app_constant.dart';
import '../../../package/custom_painter/bezier_painter.dart';
import '../../../package/custom_widgets/app_bars/sliver_appbar_delegate.dart';
import 'package:universal_lab/package/size_config.dart';
import 'package:universal_lab/package/text_style.dart';
import '../../../class/model/check_out_service/check_out_service.dart';

class CheckOutProgressBar extends StatefulWidget {
  const CheckOutProgressBar({Key? key}) : super(key: key);

  @override
  State<CheckOutProgressBar> createState() => _CheckOutProgressBarState();
}

class _CheckOutProgressBarState extends State<CheckOutProgressBar> {
  Color getColor(int index, check) {
    if (index == check.progressIndex) {
      return kSuccess;
    } else if (index < check.progressIndex) {
      return kD2Dark;
    } else {
      return kGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        maxHeight: getProportionateScreenHeight(80),
        minHeight: getProportionateScreenHeight(70),
        child: Consumer<CheckOutService>(builder: (context, check, _) {
          return Container(
            color: kLight,
            child: Timeline.tileBuilder(
              theme: TimelineThemeData(
                direction: Axis.horizontal,
                connectorTheme:
                    const ConnectorThemeData(space: 15.0, thickness: 3.0),
              ),
              builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.before,
                itemExtentBuilder: (_, __) =>
                    media.size.width / CheckOutStages.values.length,
                contentsBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      CheckOutStages.values[index].name,
                      style: stl1(12, getColor(index, check), FontWeight.w400),
                    ),
                  );
                },
                indicatorBuilder: (_, index) {
                  Color color;
                  dynamic child;
                  if (index == check.progressIndex) {
                    color = kSuccess;
                    child = Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        "${index + 1}",
                        style: stlL.copyWith(color: kLight),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (index < check.progressIndex) {
                    color = kD2Dark;
                    child = const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15.0,
                    );
                  } else {
                    color = kGrey;
                  }

                  if (index <= check.progressIndex) {
                    return Stack(
                      children: [
                        CustomPaint(
                          size: const Size(25.0, 25.0),
                          painter: BezierPainter(
                            color: color,
                            drawStart: index > 0,
                            drawEnd: index < check.progressIndex,
                          ),
                        ),
                        DotIndicator(
                          size: 25.0,
                          color: color,
                          child: child,
                        ),
                      ],
                    );
                  } else {
                    return Stack(
                      children: [
                        CustomPaint(
                          size: const Size(15.0, 15.0),
                          painter: BezierPainter(
                            color: color,
                            drawEnd: index < CheckOutStages.values.length - 1,
                          ),
                        ),
                        OutlinedDotIndicator(
                          borderWidth: 4.0,
                          color: color,
                        ),
                      ],
                    );
                  }
                },
                connectorBuilder: (_, index, type) {
                  if (index > 0) {
                    if (index == check.progressIndex) {
                      final prevColor = getColor(index - 1, check);
                      final color = getColor(index, check);
                      List<Color> gradientColors;
                      if (type == ConnectorType.start) {
                        gradientColors = [
                          Color.lerp(prevColor, color, 0.5)!,
                          color
                        ];
                      } else {
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)!
                        ];
                      }
                      return DecoratedLineConnector(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColors,
                          ),
                        ),
                      );
                    } else {
                      return SolidLineConnector(
                        color: getColor(index, check),
                      );
                    }
                  } else {
                    return null;
                  }
                },
                itemCount: CheckOutStages.values.length,
              ),
            ),
          );
        }),
      ),
    );
  }
}
