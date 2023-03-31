import 'package:flutter/material.dart';
import 'custom_drop_down_widget.dart';
import 'counter.dart';
//https://pub.dev/packages/dropdown_button2
// practice above resource 
class CustomDropDownWidget extends StatefulWidget {
  const CustomDropDownWidget({Key? key}) : super(key: key);

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  bool isOpen=false;// 1=>initially list is close
  String selectOption = 'Select Option';
  List<String> politicsList=[
    'left wing', 'liberal','moderate','conservative', 'libertarian', 'apolitical'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('drop down menu'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 50,),
              InkWell(
                onTap: (){
                  isOpen=!isOpen;// 2=>to openlist when element is selected
                  setState(() {

                  });
                },
                child: Container(// when to open that container it show drop down menue and set as true
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.pink,

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectOption),
                        Icon(isOpen ?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),
              ),
              if(isOpen)// 3=>when isopen (bool is true only then show the list else show false)

              ListView(
                primary: true,
                shrinkWrap: true,
                children: politicsList.map((e)=>Container(
                  decoration: BoxDecoration(
                    color: selectOption==e ? Colors.purple:Colors.pink,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: (){
                          selectOption=e;//2=> to select required element from list
                          isOpen=false;/// 4=>when element is selcted then close the drop drop menu
                          setState(() {

                          });
                        },
                        child: Text(e),
                    ),
                  ),
              )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

