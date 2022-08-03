import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
         leading: IconButton(onPressed: (){
           Navigator.pop(context);
         }, icon: Icon(Icons.apps_outlined))
     ),
      body: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(

            onChanged: (value){




            },
            //  controller: conteroler,
            keyboardType: TextInputType.name,style: Theme.of(context).textTheme.bodyLarge,

            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(.4),
              contentPadding: EdgeInsets.symmetric(vertical: 23,horizontal: 23),
              labelText: 'ما الذي تبحث عنه؟',labelStyle: Theme.of(context).textTheme.bodyLarge,


              suffixIcon: Icon(Icons.search,color: Colors.blue,),

              hintText: 'ما الذي تبحث عنه؟',hintStyle: Theme.of(context).textTheme.bodyLarge,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),


              ),


            ),
          ),
        ),
      ),
    );
  }
}
