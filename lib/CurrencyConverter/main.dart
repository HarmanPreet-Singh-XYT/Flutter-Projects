import 'package:flutter/material.dart';
class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  Map<String,dynamic> selectedCurrency = { 'name': "US Dollar",'sign': '\$','conversionValue': 74.58,'country': "US",'flagLink':'https://images.emojiterra.com/twitter/v13.1/512px/1f1fa-1f1f8.png'};
  Object total = '0.00';
  String currentText = '';
  final List currencies = [
        {
          'name': "US Dollar",
          'sign': '\$',
          'conversionValue': 74.58, // Example conversion value from INR to USD
          'country': "US",
          'flagLink':'https://images.emojiterra.com/twitter/v13.1/512px/1f1fa-1f1f8.png'
        },
        {
          'name': "Euro",
          'sign': "€",
          'conversionValue': 88.69, // Example conversion value from INR to EUR
          'country': "Europe",
          'flagLink':"https://images.emojiterra.com/twitter/512px/1f1ea-1f1fa.png"
        },
        {
          'name': "British Pound",
          'sign': "£",
          'conversionValue': 102.34, // Example conversion value from INR to GBP
          'country': "UK",
          'flagLink':'https://flagpedia.net/data/flags/emoji/twitter/256x256/gb.png'
        },
        {
          'name': "Russian Ruble",
          'sign': "₽",
          'conversionValue': 1.01, // Example conversion value from INR to RUB
          'country': "Russia",
          'flagLink':'https://images.emojiterra.com/twitter/512px/1f1f7-1f1fa.png'
        },
        {
          'name': "French Franc",
          'sign': "₣",
          'conversionValue': 13.52, // Historical value (not in use currently, Euro is used)
          'country': "France",
          'flagLink':'https://images.emojiterra.com/twitter/v13.1/512px/1f1eb-1f1f7.png'
        },
        {
          'name': "Canadian Dollar",
          'sign': "C\$",
          'conversionValue': 59.32, // Example conversion value from INR to CAD
          'country': "Canada",
          'flagLink':'https://images.emojiterra.com/twitter/512px/1f1e8-1f1e6.png'
        },
        {
          'name': "Japanese Yen",
          'sign': "¥",
          'conversionValue': 0.68, // Example conversion value from INR to JPY
          'country': "Japan",
          'flagLink':'https://images.emojiterra.com/twitter/v13.1/512px/1f1ef-1f1f5.png'
        },
        {
          'name': "UAE Dirham",
          'sign': "د.إ",
          'conversionValue': 20.29, // Example conversion value from INR to AED
          'country': "Dubai",
          'flagLink':'https://images.emojiterra.com/twitter/v14.0/1024px/1f1e6-1f1ea.png'
        },
        {
          'name': "Bitcoin",
          'sign': "₿",
          'conversionValue': 2272784.78, // Example conversion value from INR to BTC (fluctuates)
          'country': "Bitcoin",
          'flagLink':'https://icons.iconarchive.com/icons/froyoshark/enkel/512/Bitcoin-icon.png'
        }
    ];
    void setCurrency(Map<String,dynamic>currency){
      setState(() {
        selectedCurrency = currency;
      });
    }
    void calculateResult(){
      if(currentText.isNotEmpty){
        double input = double.parse(currentText);
        String result = (input/selectedCurrency['conversionValue']).toStringAsFixed(2);
        setState(() {
          total=result;
        });
      }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('Currency Converter',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          backgroundColor: Color(0xFF6A5ACD),
          shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
          elevation: 20,
          iconTheme:const IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        backgroundColor:const Color(0xFF2C2B2B),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('₹', style: TextStyle(fontSize: 40,color: Colors.white),),
                  const SizedBox(width: 20,),
                  Container(
                    width: 150,
                    height: 30,
                    padding:const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child:TextField(onChanged:((value){currentText=value;}),decoration:const InputDecoration(hintText: 'Enter amount',contentPadding: EdgeInsets.symmetric(vertical: 12)),keyboardType: TextInputType.number,style:const TextStyle(fontWeight: FontWeight.bold),),
                  )
                ],
              ),
              const SizedBox(height: 25,),
              GridButtons(currencies: currencies,selectedCurrency: selectedCurrency,setCurrency: setCurrency),
              ElevatedButton(onPressed:() {calculateResult();}, 
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,padding:const EdgeInsets.symmetric(vertical: 18,horizontal: 30)),
                child:const Text('Convert',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
              const SizedBox(height: 25,),
              Container(
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue
                ),
                width: MediaQuery.of(context).size.width*0.9,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${selectedCurrency['sign']}',style:const TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                      const SizedBox(width: 10,),
                      Text('$total',style:const TextStyle(fontSize: 40,fontWeight: FontWeight.w500,color: Colors.white),)
                    ],
                ),
              ),
              )
            ],
          ),
        ),
      );
  }
}

class GridButtons extends StatelessWidget {
  const GridButtons({
    super.key,
    required this.currencies,
    required this.selectedCurrency,
    required this.setCurrency
  });
  final List currencies;
  final Map<String,dynamic> selectedCurrency;
  final Function(Map<String,dynamic>) setCurrency;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: MediaQuery.of(context).size.height*0.55,
       width: 400,
      child: GridView.count(
        crossAxisCount: 3,
        padding:const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: currencies.map((each){
          return ElevatedButton(onPressed:() {setCurrency(each);}, 
          style: ElevatedButton.styleFrom(backgroundColor:selectedCurrency['country']==each['country'] ? Colors.blue : Colors.blue[100],shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('${each['flagLink']}',width: 45,height: 45,),
                  Text('${each['country']}',style:TextStyle(fontSize: 20,color:selectedCurrency['country']==each['country'] ? Colors.white : Colors.black,fontWeight: FontWeight.w700),)
                ],
              
            ),
          ));
        }).toList()
        ),
      );
  }
}