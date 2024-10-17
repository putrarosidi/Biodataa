import 'package:flutter/material.dart';

class BiodataDetail extends StatefulWidget {
  final String? nama;
  final String? alamat;
  final String? Status;
  final String? Agama;
  final String? tempatLahir;
  final String? tanggalLahir;
  final String? email;

  const BiodataDetail({
    Key? key,
    this.nama,
    this.alamat,
    this.Status,
    this.Agama,
    this.tempatLahir,
    this.tanggalLahir,
    this.email,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ItemDetailState();
  }
}

class ItemDetailState extends State<BiodataDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Biodata'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama: ${widget.nama}"),
            Text("Email: ${widget.email}"),
            Text("Tempat Lahir: ${widget.tempatLahir}"),
            Text("Tanggal Lahir: ${widget.tanggalLahir}"),
            Text("Jenis Kelamin: ${widget.Status}"),
            Text("Agama: ${widget.Agama}"),
            Text("Alamat: ${widget.alamat}"),
          ],
        ),
      ),
    );
  }
}
