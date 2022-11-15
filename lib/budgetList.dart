import 'package:counter_7/budget.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:intl/intl.dart';

class BudgetList extends StatefulWidget {
  List<Budget> myBudgetList;
  BudgetList({super.key, required this.myBudgetList});

  @override
  State<BudgetList> createState() => _BudgetListState();
}

class _BudgetListState extends State<BudgetList>{

  var f = NumberFormat.currency(locale: "id_ID",
      symbol: "Rp");

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title : const Text("Budget List")
      ),
      drawer: AppDrawer(
        myBudgetList: widget.myBudgetList,
      ),
      body: Column(
        children: [ if (widget.myBudgetList == null)
            const Center(
              child: Text("Data Kosong"),
            )
          else if (widget.myBudgetList.isEmpty)
            const Center(
              child: Text("Data Kosong"),
            )
          else
            Expanded(
               child: ListView.builder(
                itemCount: widget.myBudgetList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        title: Text(widget.myBudgetList[index]
                            .title), // ini judul isinya malah nominal
                        subtitle: Text(
                          f.format(widget.myBudgetList[index].budgetNominal)), // ini nominal isinya gaada
                        trailing: Column(
                          children: [
                            Text(widget.myBudgetList[index].date,
                            style : TextStyle( fontSize: 11.0)),
                            const Spacer(),
                            Text(widget.myBudgetList[index].type,
                            style: TextStyle(color: (widget.myBudgetList[index].type == "pemasukan") ? Colors.blue : Colors.red )),
                          ],
                        )
                      ),
                  );
                }
              )
            )
          ],
      ),
    );
  }
}
