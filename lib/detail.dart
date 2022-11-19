import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/model/watchlist.dart';


class DetailPage extends StatefulWidget{

  WatchList data;

  DetailPage({super.key, required this.data });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>{

  

  Widget build(BuildContext context){
    return(
      Scaffold(
        appBar: AppBar(
          title: const Text("Detail"),
        ),
        drawer: AppDrawer(
          myBudgetList: [],
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
          children:  [
            Align(
              
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                widget.data.fields.title,
                style: const TextStyle(
                  fontSize: 32.0
                ),
              ),
              )
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 4.0),
            child : Row(
              children: [
                const Text(
                  "Release Date: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                ),
                const SizedBox(
                //Use of SizedBox
                width: 10,
                ),
                Text(
                  widget.data.fields.releaseDate,
                  style: const TextStyle(fontSize: 16)
                )
              ],
            ),
            ),
            
           Padding(padding: const EdgeInsets.symmetric(vertical: 4.0),
            child : Row(
              children: [
                const Text(
                  "Rating: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                ),
                const SizedBox(
                //Use of SizedBox
                width: 10,
                ),
                Text(
                  "${widget.data.fields.rating}/5",
                  style: const TextStyle(fontSize: 16)
                )
              ],
            ),
            ),
           Padding(padding: const EdgeInsets.symmetric(vertical: 4.0),
            child : Row(
              children: [
                const Text(
                  "Status: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                ),
                const SizedBox(
                //Use of SizedBox
                width: 10,
                ),
                Text(
                  widget.data.fields.watched ? "watched" : "not watched",
                  style: const TextStyle(fontSize: 16)
                )
              ],
            ),
            ),
            Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child:  Text(
                  "Review: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                ),
                ),
               
                const SizedBox(
                //Use of SizedBox
                height: 2,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  widget.data.fields.description,
                  style: const TextStyle(fontSize: 16)
                ),
                ),
              ],
            ),
            const Spacer(),
            TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all( Colors.blue),
              ),  
            onPressed:(){
              Navigator.pop(context);
            }, 
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Align(
                alignment: Alignment.center,
                child :  Text(
                  "kembali",
                  style: TextStyle(color : Colors.white)
                )
              )
            ))


          ],
        ),
        )

      )
    );
  }
}