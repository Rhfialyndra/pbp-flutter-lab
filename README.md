# Tugas 7
> Rahfi A - 2106705764

---

### 1. Stateless Vs Stateful Widget<br>
- **Stateless Widget**<br> 
  Widget yang statenya tidak bisa diubah ketika sudah dibuat. state yang dimaksud, misalnya warna, data, dan atau variabel.
  
- **Stateful Widget**<br>
  Widget yang statenya bisa diubah ketika widget sudah dibuat. State yang dimaksud misalnya style widget, data, dan atau variabel. Stateful widget cocok untuk membuat widget atau fitur yang interaktif yang membutuhkan state yang dinamis.


### 2. Widget(s) used<br>
- Scaffold             : Construct a skeleton to build widget(s). 
- Appbar               : default widget to create navbar-like appbar
- Center               : Layout Widget to position children on the middle
- Column               : Layout widget for column display
- Row                  : Layout widget for Row Display
- Text                 : Text creation
- Padding              : Widget to wrap children with padding
- Spacer               : Widget to create space between children, behaves like flex
- FloatingActionButton : clickable and functional button floating on the screen


### 3. setState()<br>
Pemangggilan setState() akan memberitahu framework bahwa terjadi perubahan state pada objek tersebut. Kemudian, Framework akan melakukan build ulang pada objek tersebut (*re-render*) pada UI aplikasi. variable yang dapat terdampak adalah variable/data yang di pass sebagai argumen pada inner function setState

### 4. const vs final
Pada dasarnya const dan final sama-sama menyatakan variable yang bernilai tetap, tidak dapat diubah sama sekali. perbedaanya adalah `final` membuat variabel menjadi bernilai tetap dari awal deklarasi, sedangkan `const` membuat suatu nilai konstan pada saat compile-time. akibatnya, data `const` masih bisa diubah sebelum compile-time berlangsung.

### 5. Implementation<br>
- Buat variable pembantu di dalam function build
```dart
 bool isEven = _counter % 2 == 0;
 bool isGreaterThanZero = _counter > 0;
```
- Gunakan boolean variable tersebut untuk melakukan conditional styling dan render.
```dart
 Text(
      isEven ? 'GENAP' : 'GANJIL',
      style : TextStyle(color: isEven ? Colors.red : Colors.blue )
 ) 
```
- Buat Widget Padding yang membungkus Row Layout, dan terapkan padding.
```dart
floatingActionButton: Padding(
        padding : const EdgeInsets.all(16.0),
        child: Row(
         .
         .
         .
        ))
```

- Buat 2 tombol "add" dan "substract", dan lakukan positioning serta definisikan onPressed Event.
```dart
floatingActionButton: Padding(
        padding : const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            FloatingActionButton(
              onPressed: isGreaterThanZero ?  _decrementCounter : null,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
              backgroundColor: isGreaterThanZero ? Colors.blue : Colors.grey,
            ),
            const Spacer(),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ]
        )
      )
```

---

# **Tugas 8**

###  **Navigator.push** vs **Navigator.pushReplacement**

-   `Navigator.push`: berfungsi untuk menambahkan route baru ke stack navigasi
-   `Navigator.pushReplacement`: berfungsi untuk mengganti route yang ada di stack navigasi dengan route baru

### Widget(s)
- Scaffold             : Construct a skeleton to build widget(s). 
- Appbar               : default widget to create navbar-like appbar
- Center               : Layout Widget to position children on the middle
- Column               : Layout widget for column display
- Row                  : Layout widget for Row Display
- Text                 : Text creation
- Padding              : Widget to wrap children with padding
- Spacer               : Widget to create space between children, behaves like flex
- Container            : Widget as container to contains any other widget, behaves like div on html
- Form                 : Widget of form
- ListTile             : Behaves like inline widget that stores children on linear ordering (leading, traliing, etc)
- Drawer               : side-navbar like
- Expanded             : Widget that takes all the remaining space
- MaterialPageRoute    : Widget that refresh and render the entire page
- TextFormField        : input field

### Jenis event pada Flutter

-   onTap: event yang terjadi ketika widget di tap
-   onPressed: event yang terjadi ketika widget di tekan
-   onChanged: event yang terjadi ketika widget diubah
-   onSaved: event yang terjadi ketika widget disimpan

### Cara kerja `Navigator` saat mengganti halaman aplikasi

Navigator mengatur route dalam sebuah stack yang menyimpan page-page disertai dengan animasi transisi. _logic_ yang digunakan untuk next sama dengan Stack.push(), sedangkan untuk kembali sama dengan Stack.pop();

### Implementation

- add Intl package to pubspec.yaml
```dart
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.16.1   # here


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
```

- create Drawer on a different file for reusability and implement routing.
- create BudgetForm, and disable button when formIsInvalid
```dart
TextButton(
          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(formIsValid ? Colors.blue : Colors.grey),
          ),
          onPressed: formIsValid ? addTobudgetList : null , 
          child: const Text(
            "simpan",
            style: TextStyle(color : Colors.white)
          ))
```
- create Budget model or class
```dart

class Budget {
  late String title;
  late String type;
  late String date;
  late int budgetNominal;

  Budget(this.title, this.type, this.date, this.budgetNominal);

}
```
- create List on BudgetForm Widget and pass it to budgetList builder

- create BudgetList widget that takes list of Budget as the param
```dart
class BudgetList extends StatefulWidget {
  List<Budget> myBudgetList;
  BudgetList({super.key, required this.myBudgetList});

  @override
  State<BudgetList> createState() => _BudgetListState();
}
. 
.
.
```
- use itemBuilder to render all of the item from List of budget|
```dart
itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  title: Text(widget.myBudgetList[index]
                      .title),
                  subtitle: Text(
                    f.format(widget.myBudgetList[index].budgetNominal)), 
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
```
- use NumberFormat class to do currency formatting
```dart
var f = NumberFormat.currency(locale: "id_ID",
      symbol: "Rp");
      .
      .
      .
       subtitle: Text(
                      f.format(widget.myBudgetList[index].budgetNominal)
                      ),
      .
      .
      .
```

---

# **Tugas 9**

### Fetching JSON object tanpa Model
Kita bisa melakukan fetching dan deserialization secara manual tanpa membuat model terlebih dahulu.Namun, cara tersebut sangat tidak disarankan, sebab _type_ yang kita deklarasikan menjadi "tidak berguna" akibat value json yang berupa dynamic sehingga error akan lebih mudah terjadi pada app kita.

### Widget yang digunakan pada aplikasi ini

  -  FutureBuilder: widget yang digunakan untuk menampilkan data dari Future response API
   - CircularProgressIndicator: loading circle bar widget
   - Card: widget yang digunakan untuk menampilkan data dalam bentuk kartu
   - ListTile: widget yang digunakan untuk menampilkan data dalam bentuk list
   
### Mekanisme pengambilan data dari JSON hingga ditampilkan pada flutter

  -  Membuat model Watchlist
  -  Fetch JSON dari API
  -  Menyimpan JSON ke dalam model Watchlist
  -  Menampilkan data dari model Watchlist

### Implementation
1. set internet android permission
2. create Model for JSON object
3. create function for fetching data to API
4. use FutureBuilder to render fetched data
5. create detail page
6. integrate with Drawer
