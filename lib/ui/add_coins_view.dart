import 'package:crypto_wallet/net/flutterFire.dart';
import 'package:crypto_wallet/widgets.dart';
import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  const AddView({Key key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = ["Bitcoin", "Sol", "Ether", "Link", "Dot"];

  String dropdownValue = "Bitcoin";
  TextEditingController _Amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Add a new coin"),
      ),
      body: Container(
        color: Colors.blueAccent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DropdownButton(
                dropdownColor: Colors.blueAccent,
                iconEnabledColor: Colors.white,
                items: coins
                    .map<DropdownMenuItem<String>>((coin) => DropdownMenuItem(
                          child: Text(
                            coin,
                            style: const TextStyle(color: Colors.white),
                          ),
                          value: coin,
                        ))
                    .toList(),
                value: dropdownValue,
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
              ),
              getTextFormField(_Amount, "", "Coin amount",),
              getTextButton("Add Coin", context, () {
                addCoin(dropdownValue, _Amount.text);
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
