

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defultButton({

 required Color color,
 required double width,
  double? height,
  required VoidCallback onPressed,
  required String text,
  required double appsize,
  required FontWeight fontWeight,
  Color ?textcolor,
})=>
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(22),
    color: color,

  ),

  width: width,

  child: MaterialButton(onPressed:onPressed,
    textColor: textcolor,
    height: height,
    // setState(() {
    //   Navigator.push(context,
    //       MaterialPageRoute(builder:
    //           (context)=>MassengerScreen(),
    //       ));
    // });


    child: Text(text,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: appsize,

      ),
    ),
  ),
);

 Widget defultTextFormFild({
   bool obscureText=false,
   ValueChanged ?onChanged,
  required TextEditingController controller,
  required TextInputType type,
  required FormFieldValidator validator,
  required String labelText,
  required Widget prefixIcon,
   Widget ?suffixIcon,
  GestureTapCallback? ontap,
  bool isClicble=true,


})=>
    TextFormField(
      onChanged:onChanged ,
      controller: controller,
   onTap: ontap,
  validator:validator,
  enabled:isClicble ,



  obscureText: obscureText,
  keyboardType: type,
  decoration: InputDecoration(
    labelText: labelText,


    prefixIcon: prefixIcon,
    suffixIcon:  suffixIcon ,
    border: OutlineInputBorder(),


  ),
);

Widget buildltTaskItem(Map model)=>
    Row(


  children: [
    CircleAvatar(
      radius: 40,
      child:Text(model['time'])
      ,
    ),SizedBox(width: 8,),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(model['title']),
        Text(model['data'])


      ],
    )
  ],
);


Widget buildArticleItem(article,context)=>Padding(
  padding: const EdgeInsets.all(20),
  child: Row(mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,

    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(
                    '${article['urlToImage']}'
                ),
                fit: BoxFit.cover
            )
        ),

      ),
      SizedBox(width: 22,),
      Expanded(
        child: Column(mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Text(
              '${article['title']}'
              ,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
            SizedBox(height: 6,),
            Text('${article['description']}',
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,)

          ],
        ),
      )
    ],
  ),
);



// Widget articlebulder(list)=> ConditionalBuilder(
//
//   condition: list.length>0,
//   builder: (context)=>ListView.separated(
//     physics: BouncingScrollPhysics(),
//     itemBuilder: (context, index) => buildArticleItem(NewsCubit1.get(context).busness[index],context),
//     separatorBuilder: (BuildContext context, int index) =>Container(
//       height: AppSize.s2,
//       color: ColorManager.erorr,
//     )
//     ,
//     itemCount: list.length,),
//
//
//   fallback: (context)=>Center(child: CircularProgressIndicator()),
//
// );


Widget textThime(context,
    String name
    )=>Text(name,style: Theme.of(context).textTheme.bodyText1!.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.bold
),);

void navgiTo(context, Widget)=>Navigator.push(context,
    MaterialPageRoute(builder:
        (context)=>Widget,
    ));

void navgiToAndFinsh(context, Widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder:
        (context)=>Widget,
    ),
    (Route<dynamic>route)=>false
);


Widget defultTextButton(
{
  required VoidCallback onPressed,
  required String text,
  Color ?color,
  double? appsize,
}

    )=>TextButton(onPressed: onPressed, child: Text (text.toUpperCase(),style: TextStyle(
  fontSize: appsize,
  color: color
),

));


void showToast({required String text,

 required Color color,
  required Color textcolor
})=>
    Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: color,
    textColor: textcolor,
    fontSize: 16.0
);







//dark
ThemeData darkTheme()=>ThemeData(



  primaryIconTheme:IconThemeData(
      color: Colors.black
  )  ,
  iconTheme:IconThemeData(
    color: Colors.white
  ) ,
  cardColor: Colors.black.withOpacity(.7),
  appBarTheme: AppBarTheme(
     color: Colors.grey,
      iconTheme:IconThemeData(
        color: Colors.black,

      ) ,
      systemOverlayStyle:SystemUiOverlayStyle(
          statusBarColor:HexColor('333739'),

          statusBarIconBrightness:Brightness.light

      ),


      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.white
      ),
      actionsIconTheme: IconThemeData(
          color: Colors.white,

      )

  ),

  splashColor: Colors.red,
  //p
  primarySwatch: Colors.amber,

  bottomNavigationBarTheme: BottomNavigationBarThemeData(

      backgroundColor: HexColor('312321'),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: Colors.amber,


      )
  ),
  textTheme: TextTheme(
      bodyText1:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white
      )
  ),
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
);


//light
ThemeData tehemdata()=>ThemeData(

   primaryIconTheme:IconThemeData(
     color: Colors.white
   )  ,
  iconTheme:IconThemeData(
      color: Colors.black
  ) ,
  splashColor: Colors.green,
  scaffoldBackgroundColor: Colors.white,

  cardColor: Colors.white.withOpacity(.8),
  textTheme: TextTheme(

      bodyText1:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black
      )
  ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
      iconTheme:IconThemeData(
          color: Colors.black
      ) ,
      systemOverlayStyle:SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness:Brightness.dark

      ),

      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black
      )

  ),
  primarySwatch: Colors.amber,


  bottomNavigationBarTheme: BottomNavigationBarThemeData(

    backgroundColor: Colors.white,
    selectedItemColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: IconThemeData(
      color: Colors.amber,

    ),
  ),

);



