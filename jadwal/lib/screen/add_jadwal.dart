import 'dart:async';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentra Vaksin - Mobile Dev Phase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Info Sesi Vaksinasi Terbaru'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _status = "";

  void _updateStatus(String status) {
    setState(() {
      _status = status;
    });
  }

  DateTime selectedDate = DateTime.now();
  TextEditingController _dateController = TextEditingController();
  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        // berubah
        selectedDate = picked;
        _dateController.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _dateController.text = selectedDate.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _dateController,
                onChanged: (String value) {
                  _updateStatus("");
                },
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Waktu',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today_rounded),
                    onPressed: () => _selectDate(context),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (String value) {
                  _updateStatus("");
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Tempat Pelaksanaan',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (String value) {
                  _updateStatus("");
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Jenis Vaksin',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (String value) {
                  _updateStatus("");
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Kuota',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  onPressed: () => _updateStatus("Data telah ditambahkan!"),
                  color: Colors.pink,
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                _status,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
