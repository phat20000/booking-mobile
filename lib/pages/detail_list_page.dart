import 'package:appbooking/db/booking.dart';
import 'package:appbooking/model/book.dart';
import 'package:appbooking/pages/edit_booking_page.dart';
import 'package:flutter/material.dart';

class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Booking note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    note = await BookDatabase.instance.readBooking(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      note.name.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      note.createdAt.toString(),
                      style: const TextStyle(color: Colors.white38),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      note.district.toString(),
                      style: const TextStyle(color: Colors.white70, fontSize: 18),
                    )
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditNotePage(bookings: note),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          await BookDatabase.instance.delete(widget.noteId);

          Navigator.of(context).pop();
        },
      );
}