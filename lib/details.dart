import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_putra/models/api.dart';
import 'widgets/form.dart';
import 'models/msiswa.dart';
import 'edit.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class Details extends StatefulWidget {
  final SiswaModel sw;
  Details({required this.sw});

  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  void deleteSiswa(context) async {
    http.Response response = await http.post(
      Uri.parse(Baseurl.hapus),
      body: {
        'id': widget.sw.id.toString(),
      },
    );
    final data = json.decode(response.body);
    if (data['success']) {
      pesan();
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    }
  }

  pesan() {
    Fluttertoast.showToast(
        msg: "Data berhasil dihapus :v",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void confirmDelete(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('Yakin mau dihapus?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[600],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.cancel),
                    SizedBox(width: 8),
                    Text("Batal"),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => deleteSiswa(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle),
                    SizedBox(width: 8),
                    Text("Hapus"),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Siswa'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => confirmDelete(context),
            icon: Icon(Icons.delete, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow("ID", widget.sw.id.toString()),
                _buildDetailRow("NIS", widget.sw.nis),
                _buildDetailRow("Nama", widget.sw.nama),
                _buildDetailRow("Tempat Lahir", widget.sw.tplahir),
                _buildDetailRow("Tanggal Lahir", widget.sw.tglahir),
                _buildDetailRow("Jenis Kelamin", widget.sw.kelamin),
                _buildDetailRow("Agama", widget.sw.agama),
                _buildDetailRow("Alamat", widget.sw.alamat),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Edit(sw: widget.sw),
          ),
        ),
        label: Text("Edit"),
        icon: Icon(Icons.edit),
        backgroundColor: Colors.blueGrey[700],
      ),
    );
  }

  // Fungsi untuk menampilkan detail dalam format yang lebih rapi
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label : ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[700],
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}