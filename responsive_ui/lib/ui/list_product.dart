import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/side_menu.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key, required this.col});

  final int col;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), backgroundColor: Colors.blueAccent,),
      drawer: SideMenu(),
      body:
          Column(
            children: [
              // Image.asset("images/prm.jpg",
              //   width: double.infinity,
              //   height: 130,
              //   fit: BoxFit.cover,
              // ),
              Image(
                image: AssetImage('images/prm.jpg'),
                width: 400,
                height: 130,
                fit: .contain,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: GridView.count(
                    crossAxisCount: col,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    children: List.generate(20, (i) {
                      return Card(child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(child: Text('Product $i')),
                      ));
                    }),

                  ),
                ),
              ),
            ],
          ),

    );
  }
}

class ListProductHorizontal extends StatelessWidget {
  const ListProductHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(width: 180, child: SideMenu()),
          VerticalDivider(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(20, (i) {
                return LayoutBuilder(builder: (context, constraints) {
                  print('Card no #${i}: maxWidth = ${constraints.maxWidth}');
                  return Card(child: Text('Product $i'));
                });
              }),
            ),
          ),
        ],
      ),
    );
  }
}

