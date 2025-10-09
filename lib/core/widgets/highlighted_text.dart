import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class HighlightedText extends StatelessWidget {
  const HighlightedText({
    super.key,
    required this.text,
    required this.style,
    required this.highlightStyle,
    this.onHighlightTap,
  });

  final String text;
  final TextStyle style;
  final TextStyle highlightStyle;
  final VoidCallback? onHighlightTap;

  @override
  Widget build(BuildContext context) {
    final RegExp pattern = RegExp(r'\*\*(.*?)\*\*');
    final List<TextSpan> textSpans = [];
    int lastMatchEnd = 0;

    for (final Match match in pattern.allMatches(text)) {
      if (match.start > lastMatchEnd) {
        textSpans.add(
          TextSpan(text: text.substring(lastMatchEnd, match.start)),
        );
      }
      textSpans.add(
        TextSpan(
          text: match.group(1),
          style: highlightStyle,
          recognizer: onHighlightTap != null
              ? (TapGestureRecognizer()..onTap = onHighlightTap)
              : null,
        ),
      );
      lastMatchEnd = match.end;
    }
    if (lastMatchEnd < text.length) {
      textSpans.add(TextSpan(text: text.substring(lastMatchEnd)));
    }

    return RichText(
      text: TextSpan(style: style, children: textSpans),
    );
  }
}
