import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sex_smart/component/components.dart';
import 'package:sex_smart/provider/provider_catgory/provider_catgory.dart';
import 'package:sex_smart/recources/color_managr.dart';
import 'package:provider/provider.dart';

class DitelsEcomerce extends StatelessWidget {

  String imag;
  DitelsEcomerce(this.imag);

  @override
  Widget build(BuildContext context) {
    ProviderCatgory vendorHome2=Provider.of<ProviderCatgory>(context,listen: false)..getCatgory();

    return Scaffold(

      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
              leading: IconButton(onPressed: (){

              }, icon: CircleAvatar(
                  radius: 16,
                  backgroundColor: ColorManager.gryn,
                  child: Icon(Icons.shopping_cart,color: ColorManager.white,size: 18,))),
              actions: [
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: CircleAvatar(
                    radius: 16,
                    backgroundColor: ColorManager.gryn,
                        child: Icon(Icons.arrow_forward_ios,color: ColorManager.white,)))
              ],
              expandedHeight: 400,
              shadowColor: Colors.red,
              foregroundColor: Colors.red,

              backgroundColor: Colors.green,



              flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                var top=constraints.biggest.height;
                return FlexibleSpaceBar(
                  centerTitle: true,
                  title: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: top <=130 ?1.0 :0.0,
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: imag.toString(),height: 100,width: 100,
                          placeholder: (context, url) => SizedBox(child: Image.asset('assets/images/heart.png'),),
                          errorWidget: (context, url, error) => Icon(Icons.error,size: 100,),
                        ),
                      ],
                    ),
                  ),
                  background:   InkWell(
                    onTap: (){
                      // navgiTo(context, WebViewScreen(product.openGiveawayUrl.toString()));
                    },
                    child: CachedNetworkImage(
                      imageUrl: imag.toString(),fit: BoxFit.fill,
                      placeholder: (context, url) => SizedBox(child: Image.asset('assets/images/heart.png'),),
                      errorWidget: (context, url, error) => Icon(Icons.error,size: 100,),
                    ),
                  ),
                );
              },)
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                Column(
                  children: [

                    Text('vendorHome.name',style: Theme.of(context).textTheme.bodyLarge,),
                    Text('vendorHome.description!',style: Theme.of(context).textTheme.bodyLarge,),
                    Text('vendorHome.formattedDate!',style: Theme.of(context).textTheme.bodyLarge,),
                    Text('vendorHome.inOrder.toString()',style: Theme.of(context).textTheme.bodyLarge,),

                    SizedBox(height: 75,),

                    defultButton(
                        color: Colors.blue,
                        width: 300,
                        onPressed: (){},
                        text: 'AddToCart',
                        appsize: 22,
                        fontWeight: FontWeight.bold
                    ),
                    SizedBox(height: 55,),




                  ],
                ),
                GridView.builder(

                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: vendorHome2.list.length,
                  itemBuilder: ((context, index) {
                    return Image.network(vendorHome2.list[index].photo!,
                    fit: BoxFit.cover,
                    );
                  }), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 9,
                ),)

              ],
            ),
          ),



        ],
      ),
    );
  }
}
