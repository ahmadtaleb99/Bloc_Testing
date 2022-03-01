import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Bloc/ProductsBloc/product_bloc.dart';

import 'CardItem.dart';

class BuildCardItems extends StatelessWidget {
    BuildCardItems({Key? key}) : super(key: key);


    @override
    Widget build(BuildContext context) {
       return BlocProvider(
  create: (context) => ProductBloc(),
  child: BlocConsumer<ProductBloc, ProductState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if (state is ProductLoadInProgress)
      return CircularProgressIndicator();
   else  if    (state is ProductLoadSuccess)
    {
      return GridView.builder(
          padding: EdgeInsets.all(20),

          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            mainAxisSpacing: 25,
            crossAxisSpacing:  27,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.22 ),

          ),
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            return CardItem(
              price: state.products[index].price,
              index: index,
              rate :  state.products[index].rating.rate,
              imageUrl: state.products[index].image,
              isFavorite:  state.products[index].isFavorite,
            );
          });

    }
    if (state is ProductLoadTimeOut)
          return TextButton(onPressed: () {
      context.read<ProductBloc>().add(ProductsRequested());
    }, child: Text(' time out  '),);

    else return TextButton(onPressed: () {
     context.read<ProductBloc>().add(ProductsRequested());
      }, child: Text(' Loading has Failed ma man '),);
  },
),
);
    }
}
