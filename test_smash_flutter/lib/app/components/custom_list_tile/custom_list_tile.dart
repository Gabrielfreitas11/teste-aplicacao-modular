import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({Key? key, required this.title, this.onTap})
      : super(key: key);

  final String title;
  final Function()? onTap;

  @override
  // ignore: library_private_types_in_public_api
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      onTap: widget.onTap,
      trailing:
          widget.onTap != null ? const Icon(Icons.arrow_forward_rounded) : null,
    );
  }
}
