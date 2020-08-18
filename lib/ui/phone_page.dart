//import 'package:flutter/material.dart';
//
//class DropDown extends StatefulWidget {
//  DropDown() : super();
//
//  final String title = "DropDown Demo";
//
//  @override
//  DropDownState createState() => DropDownState();
//}
//
//class Company {
//  int id;
//  String name;
//
//  Company(this.id, this.name);
//
//  static List<Company> getCompanies() {
//    return <Company>[
//      Company(1, 'Yangon'),
//      Company(2, 'Mandalay'),
//      Company(3, 'Sagaing'),
//      Company(4, 'Mgway'),
//      Company(5, 'Ayeyarwady'),
//    ];
//  }
//}
//
//class DropDownState extends State<DropDown> {
//  //
//  List<Company> _companies = Company.getCompanies();
//  List<DropdownMenuItem<Company>> _dropdownMenuItems;
//  Company _selectedCompany;
//
//  @override
//  void initState() {
//    _dropdownMenuItems = buildDropdownMenuItems(_companies);
//    _selectedCompany = _dropdownMenuItems[0].value;
//    super.initState();
//  }
//
//  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
//    List<DropdownMenuItem<Company>> items = List();
//    for (Company company in companies) {
//      items.add(
//        DropdownMenuItem(
//          value: company,
//          child: Text(company.name),
//        ),
//      );
//    }
//    return items;
//  }
//
//  onChangeDropdownItem(Company selectedCompany) {
//    setState(() {
//      _selectedCompany = selectedCompany;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: new Scaffold(
//        appBar: new AppBar(
//          backgroundColor: Colors.redAccent,
//          title: new Text("Contents"),
//        ),
//        body: new Container(
//          child: Center(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text("Select a company"),
//                SizedBox(
//                  height: 20.0,
//                ),
//                DropdownButton(
//                  value: _selectedCompany,
//                  items: _dropdownMenuItems,
//                  onChanged: onChangeDropdownItem,
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhonePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PhonePageState();
}

class PhonePageState extends State<PhonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
          child: Card(
            child: ListView(
              children: [
                ListTile(
                    autofocus: true,
                    title: Text("ဗဟိုကူးစက်ရောဂါတိုက်ဖျက်ရေးဌာနခွဲ၊",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.red),),
                    subtitle: Text(
                        "ပြည်သူ့ကျန်းမာရေးဦးစီးဌာန(နေပြည်တော်)\t ၀၆၇-၃၄၃၁၄၃၂ / ၀၆၇-၃၄၃၁၄၃၄",style: (TextStyle(color: Colors.brown))),
                    trailing: FlatButton(
                      child: Icon(Icons.phone),
                      color: Colors.white,
                      onPressed: () {
                        launch("tel://0673431432");
                      },
                    )),
                ListTile(
                    title: Text("Public Health Emergency Operation Center",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.red),),
                    subtitle: Text(
                        "ပြည်သူ့ကျန်းမာရေးဦးစီးဌာန(နေပြည်တော်)\t ၀၆၇-၃၄၂၀၂၆၈",style: (TextStyle(color: Colors.brown))),
                    trailing: FlatButton(
                      child: Icon(Icons.phone),
                      color: Colors.white,
                      onPressed: () {
                        launch("tel://0673420268");
                      },
                    )),
                ListTile(
                    title: Text("ဒေါက်တာထွန်းတင်",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.red),),
                    subtitle: Text(
                        "	ဒုတိယညွှန်ကြားရေးမှူးချုပ်၊ (ကူးစက်)\tဒ ၀၉-၄၂၉၂၂၈၉၉၁",style: (TextStyle(color: Colors.brown))),
                    trailing: FlatButton(
                      child: Icon(Icons.phone),
                      color: Colors.white,
                      onPressed: () {
                        launch("tel://09429228991");
                      },
                    )),
                ListTile(
                    title: Text("ဒေါက်တာမိုးခိုင်",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.red),),
                    subtitle:
                        Text("ညွှန်ကြားရေးမှူး၊ ကုသရေးဦးစီးဌာန\t ၀၉-၂၁၇၄၂၇၅",style: (TextStyle(color: Colors.brown))),
                    trailing: FlatButton(
                      child: Icon(Icons.phone),
                      color: Colors.white,
                      onPressed: () {
                        launch("tel://092174275");
                      },
                    )),
                ListTile(
                    title: Text("ဒေါက်တာဉာဏ်ဝင်းမြင့်",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.red),),
                    subtitle: Text(
                        "ညွှန်ကြားရေးမှူး၊ ဗဟိုကူးစက်ရောဂါတိုက်ဖျက်ရေးဌာနခွဲ\t ၀၉-၄၅၉၁၄၉၄၇၇",style: (TextStyle(color: Colors.brown)),),
                    trailing: FlatButton(
                      child: Icon(Icons.phone),
                      color: Colors.white,
                      onPressed: () {
                        launch("tel://09459149477");
                      },
                    )),

              ],
            ),
          ),
        ));
  }
}
