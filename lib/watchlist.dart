import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/detail.dart';
import 'package:counter_7/queries/fetchWatchlist.dart';

class WatchListPage extends StatefulWidget {
    const WatchListPage({Key? key}) : super(key: key);

    @override
    _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {

    Widget build(BuildContext context){
      return Scaffold(
    appBar: AppBar(
        title: const Text('Watchlist'),
    ),
    drawer: AppDrawer(
      myBudgetList: [],
    ),
    body: FutureBuilder(
        future: fetchWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            } else {
            if (!snapshot.hasData) {
                return Column(
                children: const [
                    Text(
                    "Tidak ada watchlist :(",
                    style: TextStyle(
                        color: Color(0xff59A5D8),
                        fontSize: 20),
                    ),
                    SizedBox(height: 8),
                ],
                );
            } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=>InkWell(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailPage(data :snapshot.data![index])));
                      },
                      child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color:Colors.white,
                        border: Border.all(
                          width: 1.0,
                          color: snapshot.data![index].fields.watched ? Colors.blue : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(7.0),
                        boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 0.5
                        )
                        ]
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                            "${snapshot.data![index].fields.title}",
                            style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        const SizedBox(height: 10),
                        Text(snapshot.data![index].fields.watched ? "watched" : ""),
                        ],
                    ),
                    )
                    )
                );
            }
            }
        }
    )
);
    }
}