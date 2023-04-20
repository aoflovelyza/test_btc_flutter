import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogicalTestScreen extends StatefulWidget {
  const LogicalTestScreen({super.key});

  static const String routeName = '/logicalTestScreen';

  @override
  State<LogicalTestScreen> createState() => _LogicalTestScreenState();
}

class _LogicalTestScreenState extends State<LogicalTestScreen> {
  final txtPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logical Test"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: txtPrice,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "กรอกจำนวน",
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              setState(() {});
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            _validate(txtPrice.text) ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

String? _validate(String? text) {
  String? textValidate = "ผ่าน";

  if (text?.isEmpty ?? false) {
    textValidate = "กรุณากรอกจำนวน";
  } else if (((text?.length ?? 0) < 6)) {
    textValidate = "ความยาวมากกว่าหรือเท่ากับ 6 ตัวอักษร";
  } else {
    int countDup = 0;
    for (int index = 0; index < (text?.length ?? 0); index++) {
      if (index > 0) {
        if (text?[index] == text?[index - 1]) {
          countDup += 1;
          if (countDup > 2) {
            textValidate = "จะต้องกันไม่ให้มีเลขชุดซ้ำ เกิน 2 ชุด";
          }
        }

        if ((text?.length ?? 0) < (index - 2)) {
          if (text?[index] == text?[index - 1] &&
              text?[index - 1] == text?[index - 2]) {
            textValidate = "จะต้องกันไม่ให้มีเลขซ้ำติดกันเกิน 2 ตัว";
          }
        }

        if ((index - 2) >= 0) {
          if ((int.parse(text?[index] ?? "0") ==
                  (int.parse(text?[index - 1] ?? "0") - 1) &&
              (int.parse(text?[index] ?? "0") ==
                  (int.parse(text?[index - 2] ?? "0") - 2)))) {
            textValidate = "จะต้องกันไม่ให้มีเลขเรียงกันเกิน 2 ตัว";
          }

          if ((int.parse(text?[index] ?? "0") ==
                  (int.parse(text?[index - 1] ?? "0") + 1) &&
              (int.parse(text?[index] ?? "0") ==
                  (int.parse(text?[index - 2] ?? "0") + 2)))) {
            textValidate = "จะต้องกันไม่ให้มีเลขเรียงกันเกิน 2 ตัว";
          }
        }
      }
    }
  }

  return textValidate;
}
