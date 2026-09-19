import 'package:flutter/widgets.dart';

extension IntExtensions on int {
  Widget toHeightGap() {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget toWidthGap() {
    return SizedBox(
      width: toDouble(),
    );
  }

  String toTimeDescription() {
    final years = this ~/ 12;
    final months = this % 12;

    final yearString = years > 0 ? '$years year${years > 1 ? 's' : ''}' : '';
    final monthString = months > 0 ? '$months mo${months > 1 ? 's' : ''}' : '';

    if (years > 0 && months > 0) {
      return '$yearString $monthString';
    } else if (years > 0) {
      return yearString;
    } else if (months > 0) {
      return monthString;
    } else {
      return 'Less than a month';
    }
  }

  String toPostedAgo() {
    final now = DateTime.now();
    final postedDate = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    final difference = now.difference(postedDate);

    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else if (difference.inDays >= 7) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  String toFormattedNumber() {
    return toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  String toAgeStr() {
    final now = DateTime.now();
    final birthDate = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    final age = now.year - birthDate.year;
    return age.toString();
  }
}
