import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kjproductdetail/repository/product_detailrepo.dart';
import 'bloc/productdetail_bloc.dart';
import 'bloc/productdetail_event.dart';
import 'bloc/productdetail_state.dart';
import 'main.dart';


void main() {
  runApp(MyStatelessWidget());
}


class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(repository: ProductRepository()),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            BlocProvider.of<ProductBloc>(context).add(FetchProduct());
          }
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductLoaded) {
            final product = state.product;
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 25.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()), // Navigate to SecondScreen
                    );
                  },
                ),
                centerTitle: true,
                // title: Text('Stateless Widget Example'),
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'lib/assets/Screenshot 2024-02-07 095219.png', // Path to your image asset
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.contain, // Adjust the fit as needed
                        ),
                        Positioned(
                          top: 10, // Adjust the top position of the button
                          right: 10, // Adjust the right position of the button
                          child: IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {
                              // Handle button press
                            },
                            color: Colors.black,
                            iconSize: 30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 10, bottom: 10, right: 10),
                          child: Text(
                            "\$${product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.star,
                            size: 20, // Adjust the size as needed
                            color: Colors.amber, // Adjust the color as needed
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "${product.rating} (${product.reviewCount} Review)",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Details",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 20, top: 10, right: 20),
                        child: Text(
                          product.description,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Color:",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Container(
                            width: 40, // Width of the outer black container
                            height: 40, // Height of the outer black container
                            decoration: BoxDecoration(
                              color: Colors.white, // Color of the container
                              border: Border.all(
                                color: Colors.grey, // Border color
                                width: 1, // Border width
                              ),
                            ), // Color of the outer black container
                            child: Center(
                              child: Container(
                                width: 25, // Width of the inner square container
                                height: 25, // Height of the inner square container
                                color: Colors.black, // Color of the inner square container
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Container(
                            width: 40, // Width of the outer black container
                            height: 40, // Height of the outer black container
                            decoration: BoxDecoration(
                              color: Colors.white, // Color of the container
                              border: Border.all(
                                color: Colors.grey, // Border color
                                width: 1, // Border width
                              ),
                            ), // Color of the outer black container
                            child: Center(
                              child: Container(
                                width: 25, // Width of the inner square container
                                height: 25, // Height of the inner square container
                                color: Colors.amberAccent, // Color of the inner square container
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Container(
                            width: 40, // Width of the outer black container
                            height: 40, // Height of the outer black container
                            decoration: BoxDecoration(
                              color: Colors.white, // Color of the container
                              border: Border.all(
                                color: Colors.grey, // Border color
                                width: 1, // Border width
                              ),
                            ), // Color of the outer black container
                            child: Center(
                              child: Container(
                                width: 25, // Width of the inner square container
                                height: 25, // Height of the inner square container
                                color: Colors.black, // Color of the inner square container
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Container(
                            width: 40, // Width of the outer black container
                            height: 40, // Height of the outer black container
                            decoration: BoxDecoration(
                              color: Colors.white, // Color of the container
                              border: Border.all(
                                color: Colors.grey, // Border color
                                width: 1, // Border width
                              ),
                            ), // Color of the outer black container
                            child: Center(
                              child: Container(
                                width: 25, // Width of the inner square container
                                height: 25, // Height of the inner square container
                                color: Colors.amber, // Color of the inner square container
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "Size:",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Container(
                          width: 160, // Width of the outer black container
                          height: 50, // Height of the outer black container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white, // Color of the container
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 0.5, // Border width
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Choose Size",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios),
                                iconSize: 10,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.9, // Width of the outer black container
                          height: 55, // Height of the outer black container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.orange, // Color of the container
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 0.5, // Border width
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ProductError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Container();
        },
      ),
    );
  }
}
