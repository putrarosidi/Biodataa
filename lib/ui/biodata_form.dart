import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'biodata_detail.dart';
import 'package:group_radio_button/group_radio_button.dart';

class BiodataForm extends StatefulWidget {
  const BiodataForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BiodataFormState();
  }
}

class BiodataFormState extends State<BiodataForm> {
  final namaTextboxController = TextEditingController();
  final emailTextboxController = TextEditingController();
  final tempatLahirTextboxController = TextEditingController();
  final tanggalLahirTextboxController = TextEditingController();
  final alamatTextboxController = TextEditingController();
  final status = ["Laki - Laki", "Perempuan"];
  String _verticalGroupValue = "Laki - Laki";

  final List<String> items = [
    'Islam',
    'Katolik',
    'Kristen',
    'Hindu',
    'Budda',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Input Biodata",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    textboxNama(),
                    const SizedBox(height: 16),
                    textboxEmail(),
                    const SizedBox(height: 16),
                    _textboxGenderWarga(),
                    const SizedBox(height: 16),
                    textboxTempatLahir(),
                    const SizedBox(height: 16),
                    textboxTanggalLahir(),
                    const SizedBox(height: 16),
                    agama(),
                    const SizedBox(height: 16),
                    textboxAlamat(),
                    const SizedBox(height: 20),
                    tombolSimpan(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textboxNama() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      controller: namaTextboxController,
    );
  }

  Widget textboxEmail() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      controller: emailTextboxController,
    );
  }

  Widget _textboxGenderWarga() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Gender"),
          const SizedBox(height: 8),
          RadioGroup<String>.builder(
            direction: Axis.horizontal,
            groupValue: _verticalGroupValue,
            onChanged: (value) => setState(() {
              _verticalGroupValue = value!;
            }),
            items: status,
            itemBuilder: (item) => RadioButtonBuilder(
              item,
            ),
            fillColor: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget textboxTempatLahir() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Tempat Lahir",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      controller: tempatLahirTextboxController,
    );
  }

  Widget textboxTanggalLahir() {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Tanggal Lahir",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      controller: tanggalLahirTextboxController,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          setState(() {
            tanggalLahirTextboxController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          });
        }
      },
    );
  }


  Widget agama() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'Agama',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
          });
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: double.infinity,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
        underline: Container(), // Remove the underline
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 2.0),
          ),
        ),
      ),
    );
  }

  Widget textboxAlamat() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Alamat",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      controller: alamatTextboxController,
    );
  }

  Widget tombolSimpan() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        String nama = namaTextboxController.text;
        String email = emailTextboxController.text;
        String tempatLahir = tempatLahirTextboxController.text;
        String tanggalLahir = tanggalLahirTextboxController.text;
        String alamat = alamatTextboxController.text;
        String Status = _verticalGroupValue;
        String? Agama = selectedValue;

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BiodataDetail(
              nama: nama,
              email: email,
              tempatLahir: tempatLahir,
              tanggalLahir: tanggalLahir,
              alamat: alamat,
              Status: Status,
              Agama: Agama,
            )));
      },
      child: const Text(
        'Simpan',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}