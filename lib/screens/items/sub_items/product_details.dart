import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../package/custom_widgets/divide.dart';
import '../../../package/text_style.dart';
import '../../home_page/sub_home_page/settings/sub_settings/options_card.dart';
import '../item_details/item_details.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({
    super.key,
    required this.widget,
  });

  final ItemDetails widget;
  final staticAnchorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        Rows(
          title: Text(
            "Product Details",
            style: stlight.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          widget: const SizedBox(),
        ),
        const SizedBox(height: 10),
        // Divide(height: 10, color: Colors.blue[50]!),
        Html(
          anchorKey: staticAnchorKey,
          data: widget.item.description.isEmpty
              ? "No Details Available"
              : widget.item.description,
          style: {
            "table": Style(
              backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            "th": Style(
              padding: HtmlPaddings.all(6),
              backgroundColor: Colors.grey,
            ),
            "td": Style(
              padding: HtmlPaddings.all(6),
              border: const Border(bottom: BorderSide(color: Colors.grey)),
            ),
            'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
            'flutter': Style(
              display: Display.block,
              fontSize: FontSize(5, Unit.em),
            ),
            ".second-table": Style(
              backgroundColor: Colors.transparent,
            ),
            ".second-table tr td:first-child": Style(
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.end,
            ),
          },
          extensions: [
            TagWrapExtension(
                tagsToWrap: {"table"},
                builder: (child) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: child,
                  );
                }),
            // TagExtension(
            //   tagsToExtend: {"tex"},
            //   builder: (context) => Math.tex(
            //     context.innerHtml,
            //     mathStyle: MathStyle.display,
            //     textStyle: context.styledElement?.style.generateTextStyle(),
            //     onErrorFallback: (FlutterMathException e) {
            //       return Text(e.message);
            //     },
            //   ),
            // ),
            TagExtension.inline(
              tagsToExtend: {"bird"},
              child: const TextSpan(text: "🐦"),
            ),
            TagExtension(
              tagsToExtend: {"flutter"},
              builder: (context) => CssBoxWidget(
                style: context.styledElement!.style,
                child: FlutterLogo(
                  style: context.attributes['horizontal'] != null
                      ? FlutterLogoStyle.horizontal
                      : FlutterLogoStyle.markOnly,
                  textColor: context.styledElement!.style.color!,
                  size: context.styledElement!.style.fontSize!.value,
                ),
              ),
            ),
            ImageExtension(
              handleAssetImages: false,
              handleDataImages: false,
              networkDomains: {"flutter.dev"},
              child: const FlutterLogo(size: 36),
            ),
            ImageExtension(
              handleAssetImages: false,
              handleDataImages: false,
              networkDomains: {"mydomain.com"},
              networkHeaders: {"Custom-Header": "some-value"},
            ),
            // const MathHtmlExtension(),
            // const AudioHtmlExtension(),
            // const VideoHtmlExtension(),
            // const IframeHtmlExtension(),
            // const TableHtmlExtension(),
            // const SvgHtmlExtension(),
          ],
          onLinkTap: (url, _, __) {
            debugPrint("Opening $url...");
          },
          onCssParseError: (css, messages) {
            debugPrint("css that errored: $css");
            debugPrint("error messages:");
            for (var element in messages) {
              debugPrint(element.toString());
            }
            return '';
          },
        ),
        // Html(
        //   data: widget.item.description.isEmpty
        //       ? "No Details Available"
        //       : """${widget.item.description} """,
        //   style: {
        //     'p': Style(
        //       fontSize: FontSize(15.0),
        //       maxLines: 4,
        //       textOverflow: TextOverflow.ellipsis,
        //     ),
        //     'strong': Style(fontWeight: FontWeight.bold),
        //     "table": Style(
        //       backgroundColor: kError,
        //       border: Border.all(color: Colors.grey),
        //     ),
        //     "tr": Style(
        //       border: const Border(bottom: BorderSide(color: Colors.grey)),
        //     ),
        //     "th": Style(
        //       padding: HtmlPaddings.all(5),
        //       backgroundColor: Colors.grey,
        //     ),
        //     "td": Style(
        //       padding: HtmlPaddings.all(5),
        //       alignment: Alignment.topLeft,
        //     ),
        //     "ul": Style(margin: Margins.all(5)),
        //     "li": Style(),
        //   },
        //   // customRender: {
        //   //   "table": (context, child, attributes, _) {
        //   //     return SingleChildScrollView(
        //   //       scrollDirection: Axis.horizontal,
        //   //       child: Table(
        //   //         border: TableBorder.all(color: Colors.grey), // Add border for the table
        //   //         defaultColumnWidth: const IntrinsicColumnWidth(),
        //   //         columnWidths: const {
        //   //           0: FlexColumnWidth(),
        //   //           1: FlexColumnWidth(),
        //   //         },
        //   //         children: child,
        //   //       ),
        //   //     );
        //   //   },
        //   //   "tr": (context, child, attributes, _) {
        //   //     return TableRow(children: child);
        //   //   },
        //   //   "td": (context, child, attributes, _) {
        //   //     return TableCell(
        //   //       verticalAlignment: TableCellVerticalAlignment.middle,
        //   //       child: Padding(
        //   //         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        //   //         child: child,
        //   //       ),
        //   //     );
        //   //   },
        //   //   "th": (context, child, attributes, _) {
        //   //     return TableCell(
        //   //       child: Padding(
        //   //         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        //   //         child: DefaultTextStyle.merge(
        //   //           style: const TextStyle(fontWeight: FontWeight.bold),
        //   //           child: child,
        //   //         ),
        //   //       ),
        //   //     );
        //   //   },
        //   //   "ul": (context, child, attributes, _) {
        //   //     return Padding(
        //   //       padding: const EdgeInsets.symmetric(vertical: 4),
        //   //       child: child,
        //   //     );
        //   //   },
        //   //   "li": (context, child, attributes, _) {
        //   //     return Padding(
        //   //       padding: const EdgeInsets.symmetric(vertical: 2),
        //   //       child: Row(
        //   //         crossAxisAlignment: CrossAxisAlignment.start,
        //   //         children: [
        //   //           SizedBox(width: 8, height: 8, child: BulletPoint()), // Custom bullet point widget
        //   //           Expanded(child: child),
        //   //         ],
        //   //       ),
        //   //     );
        //   //   },
        //   // },
        // )
        ///
        // Html(
        //   data: widget.item.description.isEmpty
        //       ? "No Details Available"
        //       : widget.item.description,
        //   // shrinkWrap: true,
        //   style: {
        //     'p': Style(
        //         fontSize: FontSize(15.0),
        //         maxLines: 4,
        //         textOverflow: TextOverflow.ellipsis),
        //     'strong': Style(fontWeight: FontWeight.bold),
        //     "table": Style(
        //       backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        //     ),
        //     "tr": Style(
        //       border: const Border(bottom: BorderSide(color: Colors.grey)),
        //     ),
        //     "th": Style(
        //       padding: HtmlPaddings.all(2),
        //       backgroundColor: Colors.grey,
        //     ),
        //     "td": Style(
        //       padding: HtmlPaddings.all(2),
        //       alignment: Alignment.topLeft,
        //     ),
        //     // text that renders h1 elements will be red
        //     "h1": Style(color: Colors.red),
        //   },
        // ),
      ],
    );
  }
}
