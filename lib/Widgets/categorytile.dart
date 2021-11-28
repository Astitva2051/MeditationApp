import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String url;
  final String name;
  const CategoryTile({Key? key, required this.url, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.blue.shade300,
          child: GridTile(
            child:
              Image.network(url,fit: BoxFit.cover,),
             footer : Container(
               padding: EdgeInsets.symmetric(horizontal: 8),
               color: Colors.black.withOpacity(0.5),
               child: Center(
                child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            ),
             ),
            
          ),
        )

        );
  }
}
