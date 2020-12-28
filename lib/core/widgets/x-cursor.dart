import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class XCursor extends MouseRegion {
  static final appContainer = kIsWeb ? html.window.document.querySelectorAll('flt-glass-pane')[0] : null;

  XCursor({Widget child, String style: XCursor.pointer})
      : super(
            onHover: (PointerHoverEvent evt) => kIsWeb ? appContainer.style.cursor = style : '',
            onExit: (PointerExitEvent evt) => kIsWeb ? appContainer.style.cursor = XCursor.def : '',
            child: child);

  static const String def = 'default';
  static const String pointer = 'pointer';
  static const String auto = 'auto';
  static const String move = 'move';
  static const String noDrop = 'no-drop';
  static const String colResize = 'col-resize';
  static const String allScroll = 'all-scroll';
  static const String notAllowed = 'not-allowed';
  static const String rowResize = 'row-resize';
  static const String crosshair = 'crosshair';
  static const String progress = 'progress';
  static const String eResize = 'e-resize';
  static const String neResize = 'ne-resize';
  static const String text = 'text';
  static const String nResize = 'n-resize';
  static const String nwResize = 'nw-resize';
  static const String help = 'help';
  static const String verticalText = 'vertical-text';
  static const String sResize = 's-resize';
  static const String seResize = 'se-resize';
  static const String inherit = 'inherit';
  static const String wait = 'wait';
  static const String wResize = 'w-resize';
  static const String swResize = 'sw-resize';
}
