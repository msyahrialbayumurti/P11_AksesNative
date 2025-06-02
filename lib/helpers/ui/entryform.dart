import 'package:fitur_native/helpers/models/contact.dart';
import 'package:flutter/material.dart';

class EntryForm extends StatefulWidget {
  final Contact contact;
  const EntryForm(this.contact, {super.key});

  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  Contact? _contact;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _contact = widget.contact;
    if (_contact!.name != "") {
      _nameController.text = _contact!.name;
      _phoneController.text = _contact!.phone;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: _contact!.name == ""
            ? const Text("Tambah Data")
            : const Text("Ubah Data"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            // Nama
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            // Nomor Telepon
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "No Handphone",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            // Tombol Simpan dan Batal
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  // Tombol Simpan
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        "Simpan",
                      ),
                      onPressed: () {
                        if (_contact == null) {
                          _contact = Contact(
                            _nameController.text,
                            _phoneController.text,
                          );
                        } else {
                          _contact!.name = _nameController.text;
                          _contact!.phone = _phoneController.text;
                        }
                        Navigator.pop(context, _contact);
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  // Tombol Batal
                  Expanded(
                    child: ElevatedButton(
                      child: const Text("Batal"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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