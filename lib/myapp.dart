import 'package:flutter/material.dart';
import 'package:calbirthdate/calLogic.dart';
import 'package:calbirthdate/classLogic.dart';
import 'package:calbirthdate/myapp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // TODO: implement widget

  Widget build(BuildContext context) {
    TextEditingController _text = TextEditingController();
    return Center(
        child: Container(
      width: 335,
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _text,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
                labelText: "Enter your Birthdate e.g.'dd/MM/yyyy' ",
                hintMaxLines: 0,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0))),
            onChanged: (value) {
              if (value.isNotEmpty) {
                try {
                  final DateTime d = DateFormat("dd/MM/yyyy").parse(value);

                  context.read<BirthBloc>().add(Birthdate(date: d));
                  context.read<BirthBloc>().add(CalBirth());
                } catch (e) {
                  print("Invalid format : $e");
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please enter valid numbers")),
                );
              }
            },
          ),
          BlocBuilder<BirthBloc, BirthdateLogic>(
            builder: (context, state) => ElevatedButton(
              onPressed: () {
                final state = context.read<BirthBloc>().state;
                if (state.year > 0) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.deepOrange.shade50,
                        titlePadding: EdgeInsets.symmetric(horizontal: 10.0),
                        title: const Text(
                          "Your AGE",
                          style: TextStyle(color: Colors.blue),
                        ),
                        content: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Your Age is ${state.year} Year:${state.month} Months:${state.day} Days ",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  // Ensuring ScaffoldMessenger context is valid
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter a valid birthdate first"),
                    ),
                  );
                }

                _text.clear();
              },
              //onPressed: () {
              //  showDialog(
              //      context: context,
              //      builder: (BuildContext context) {
              //        //print("======================= ${state.current.}");
              //        return AlertDialog(
              //          title: Text(" Your Age is ${state.year}  "),
              //        );
              //      });
              //
              //  _text.clear();
              //},
              child: const Text("Cal Age"),
            ),
          )
        ],
      ),
    ));
  }
}
