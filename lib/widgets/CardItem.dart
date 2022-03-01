import 'package:flutter/material.dart';
import 'package:untitled/main.dart';


class CardItem extends StatefulWidget{
  final String imageUrl;
  final double price;
  final double rate;
  final bool isFavorite;
  final int index;
  CardItem(
      {Key? key,
      required this.imageUrl,
      required this.price,
      required this.rate,
      required this.isFavorite,
      required this.index})
      : super(key: key);

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem>   with SingleTickerProviderStateMixin{

 late AnimationController _controller;
  late Animation _myAnimation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _myAnimation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166,
      height: 225,
      decoration: BoxDecoration(
          color: kIsDarkMode ? Colors.grey.shade600 : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        child: Column(
          children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {

                      },
                      icon:  Icon(
                              Icons.favorite,
                              color: kIsDarkMode ? Colors.pink : Colors.red,
                            )
                      ),
                  IconButton(
                      onPressed: () {

                      },
                      icon: Transform(   alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.002)
                            ..rotateX(3.14*(_myAnimation.value)),child: Icon(Icons.shopping_cart))),
                ],
              ),
            Container(
              width: 153,
              height: 133.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Hero(
                tag: 'detail',
                child: InkWell(
                  onTap: () {

                  },
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 11),
              child: Row(
                children: [
                  Text('price'),
                  SizedBox(
                    width: 66,
                  ),
                  Container(

                    decoration: BoxDecoration(
                      color: kIsDarkMode ? Colors.pink : Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Text('rate'),
                          const Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
