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
