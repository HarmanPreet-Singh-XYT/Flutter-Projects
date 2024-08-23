import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({super.key});

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  final lowercaseLetters = [
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 
      'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  ];
  final uppercaseLetters = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ];
  final numbers = [
      '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
  ];
  final symbols = [
      '!', '@', '#', '\$', '%', '^', '&', '*', '(', ')', '-', '_', '=', 
      '+', '[', ']', '{', '}', '\\', '|', ';', ':', "'", '"', ',', '.', 
      '<', '>', '/', '?', '~', '`'
  ];
  Map<String,bool?> options = {'lowercase':false,'uppercase':false,'numbers':false,'symbols':false};
  String generatedPassword = 'Your Password';
  String passLength = '10';
  String randomCharacter(List array){
    int arrLength = array.length;
    int arrIndex = Random().nextInt(arrLength);
    List selectedArr = array[arrIndex];
    int index = Random().nextInt(selectedArr.length);
    return selectedArr[index];
  }
  List<List<String>> checkOptions() {
    List<List<String>> values = [];
    if (!options['lowercase']! && !options['uppercase']! && !options['numbers']! && !options['symbols']!) {
      values.addAll([lowercaseLetters, uppercaseLetters, numbers, symbols]);
    } else {
      if (options['lowercase']!) values.add(lowercaseLetters);
      if (options['uppercase']!) values.add(uppercaseLetters);
      if (options['numbers']!) values.add(numbers);
      if (options['symbols']!) values.add(symbols);
    }
    return values;
  }
  void generatePassword(int length){
    if(length!=0 && passLength!='0'){
        // Vibration.vibrate();
        List valuesArr = checkOptions();
        String pass = "";
        for(int x = 0;x<length;x++){
            pass += randomCharacter(valuesArr);
        };
        setState(() {
          generatedPassword = pass;
        });
    }
    // else showRequirementToast();
  }
  void resetParams(){
    setState(() {
      options = {'lowercase':false,'uppercase':false,'numbers':false,'symbols':false};
      generatedPassword = 'Your Password';
    });
  }
  void setOption(String type,bool? parameter){
    options[type] = parameter;
  }
  Future copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: generatedPassword));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('Password Generator',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: Color(0xFF6A5ACD),
          shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
          elevation: 20,
          iconTheme:const IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        backgroundColor:const Color(0xFF2C2B2B),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.9,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                const Text('Password Generator',style: TextStyle(color: Color(0xFFB8B8B8),fontSize: 24,fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Password Length',style: TextStyle(color: Color(0xFFB8B8B8),fontSize: 20),),
                    SizedBox(
                      height: 50,
                      width: 100,
                      child:TextFormField(initialValue: passLength,keyboardType: TextInputType.number,
                      decoration: InputDecoration(focusedBorder:const OutlineInputBorder( borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),),
                      enabledBorder: OutlineInputBorder(borderSide:const BorderSide(color: Colors.white, width: 2.0),borderRadius: BorderRadius.circular(50)),),
                      style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,textAlignVertical: TextAlignVertical.top,maxLength: 2,
                      onChanged:(value){passLength=value;},),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Include Lowercase letters',style: TextStyle(color: Color(0xFFB8B8B8),fontSize: 18),),
                    RoundCheckBox(isChecked:options['lowercase'],onTap: (selected){setOption('lowercase', selected);},borderColor: Colors.green,uncheckedColor:const Color(0xFF2C2B2B),size: 32,)
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Include Uppercase letters',style: TextStyle(color: Color(0xFFB8B8B8),fontSize: 18),),
                    RoundCheckBox(isChecked:options['uppercase'],onTap: (selected){setOption('uppercase', selected);},borderColor: Colors.yellow,uncheckedColor:const Color(0xFF2C2B2B),size: 32,checkedColor: Colors.yellow,)
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Include Numbers',style: TextStyle(color: Color(0xFFB8B8B8),fontSize: 18),),
                    RoundCheckBox(isChecked:options['numbers'],onTap: (selected){setOption('numbers', selected);},borderColor: Colors.purple,uncheckedColor:const Color(0xFF2C2B2B),size: 32,checkedColor: Colors.purple,)
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Include Symbols',style: TextStyle(color: Color(0xFFB8B8B8),fontSize: 18),),
                    RoundCheckBox(isChecked:options['symbols'],onTap: (selected){setOption('symbols', selected);},borderColor: Colors.red,uncheckedColor:const Color(0xFF2C2B2B),size: 32,checkedColor: Colors.red,)
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed:() {resetParams();}, 
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[300],padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 50)),
                    child:const Text('Reset',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
                    const SizedBox(width: 10,),
                    ElevatedButton(onPressed:() {if(passLength!='') generatePassword(int.parse(passLength));}, 
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 30)),
                    child:const Text('Generate',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                  ],
                ),
                const SizedBox(height: 50,),
                Container(
                  padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Container(
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.6),
                        child: Text(generatedPassword,style:const TextStyle(fontSize: 26,fontWeight: FontWeight.bold),softWrap: true,),
                      ),
                      const SizedBox(),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: IconButton(onPressed: (){copyToClipboard();}, icon: Image.network('https://cdn-icons-png.flaticon.com/512/221/221407.png'),iconSize: 40,)
                      )
                    ],
                  ),
                )
              ],
            ),

          ),
        ),
      );
  }
}