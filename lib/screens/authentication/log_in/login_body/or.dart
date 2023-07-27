import 'package:flutter/material.dart';

Row or =                  Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    _buildDivider(),
    const Text(" or "),
    _buildDivider(),
  ],
);
Expanded _buildDivider() {
  return const Expanded(
    child: Divider(thickness: 0.5, color: Colors.grey),
  );
}