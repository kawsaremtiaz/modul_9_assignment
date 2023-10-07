import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  String name;
  double unitPrice;
  String imageUrl;
  int quantity;

  Product(this.name, this.unitPrice, this.imageUrl, this.quantity);
}

class MyBagPage extends StatefulWidget {
  const MyBagPage({super.key});

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {

  List<Product> products = [
    Product('New Coming Soon', 10.0, 'https://mir-s3-cdn-cf.behance.net/projects/808/441b6e125829215.Y3JvcCwxMDU2LDgyNiwxMDEsMA.png', 1),
    Product('Coming Soon', 15.0, 'https://mir-s3-cdn-cf.behance.net/projects/808/17b3ab125833267.Y3JvcCwxMDk4LDg1OSw4NCww.png', 1),
    Product('Call To Action', 20.0, 'https://mir-s3-cdn-cf.behance.net/projects/808/c5dc7f125762063.Y3JvcCw4MDgsNjMyLDE1OCww.png', 1),
  ];
  void _incrementQuantity(int index) {
    setState(() {
      products[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (products[index].quantity > 1) {
        products[index].quantity--;
      }
    });
  }

  double _calculateTotalPrice(int index) {
    return products[index].unitPrice * products[index].quantity;
  }

  _totalPriceAmmount(){
    double totalPriceAmo = 0.0;
    for(int i = 0; i<products.length; i++) {
      setState(() {
        totalPriceAmo += _calculateTotalPrice(i);
      });
    }
    return Text("${totalPriceAmo.toString()}\$",style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black));
  }

  _showSnackBar() {
    double totalAmount = 0.0;
    for (int i = 0; i < products.length; i++) {
      totalAmount += _calculateTotalPrice(i);
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Congratulations! Your order total is \$${totalAmount.toStringAsFixed(2)}.'),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bag", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
        centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
           IconButton(
             icon: const Icon(Icons.search),
             color: Colors.black,
             onPressed: () {
                 },
          ),
         ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 70,
            child: ListView.builder(
              itemCount: products.length,
                itemBuilder: (context, index){
                  return Container(
                    height: 110,
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 110,
                              width: 90,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(10)),
                                  child: Image.network(products[index].imageUrl, fit: BoxFit.fill,)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(products[index].name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Responsive: Yes"),
                                      SizedBox(width: 10,),
                                      Text("Page: 1"),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(50),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 10,
                                                )
                                              ]
                                          ),
                                          child: IconButton(
                                            onPressed: (){
                                              _incrementQuantity(index);
                                            },
                                            icon: const Icon(
                                              CupertinoIcons.plus,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                          )
                                      ),
                                       Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("${products[index].quantity}",style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(50),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 10,
                                                )
                                              ]
                                          ),
                                          child: IconButton(
                                            onPressed: (){
                                              _decrementQuantity(index);
                                            },
                                            icon: const Icon(
                                              CupertinoIcons.minus,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                          )
                                      )

                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.more_vert),
                              Text("${products[index].unitPrice}\$",style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
            )
          ),
          Expanded(
            flex: 30,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total ammount:"),
                      Container(
                        child: _totalPriceAmmount(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
                        )),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(15))
                      ),
                        onPressed: (){
                          _showSnackBar();
                        },
                        child: const Text("CHECK OUT",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white))
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
