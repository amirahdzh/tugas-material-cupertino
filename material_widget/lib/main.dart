import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<Color> myColor = [
    Colors.pink,
    Colors.purple,
    Colors.cyan,
    Colors.lightBlue
  ];
  final List<Text> myText = [
    Text("Haloo..!"),
    Text("Namaku"),
    Text("Amirah Dzatul Himmah"),
    Text("@amiwrajinbelajar"),
  ];

  // final List<Widget> myList = List.generate(
  //     9,
  //     (index) => Text(
  //           index.toString(),
  //         ));

  // List<Container> hanya bisa diisi oleh Container aja,
  // biar lebih fleksibel, kita pakainya List<Widget>.

  // Container ini untuk 'body: ListView'
  // List<Widget> myList = [
  //   Container(
  //     height: 300,
  //     width: 300,
  //     color: Colors.pink,
  //   ),
  //   Container(
  //     height: 300,
  //     width: 300,
  //     color: Colors.purple,
  //   ),
  //   Container(
  //     height: 300,
  //     width: 300,
  //     color: Colors.cyan,
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      /**
             * Kalau make 'body: Column/Row' hasilnya bakal rusak,
             * karena container melebihi dari lebar/tinggi layar hp.
             * Gunakan 'body: ListView()' biar jadi scrollable
             * Listview, direction defaultnya ke arah vertikal
             * jadi, otomatis childrennya akan memiliki full
             * width dari sebuah screen. begitupun sebaliknya
             * apabila arah scroll nya diubah (scrollDirection).
             * ada jenis listview yg lain, silahkan liat doc nya
             * List.builder --> memerlukan itemCount, item Builder
             * List.separated --> mirip List.builder, tapi memerlukan
             *   -----------------separatorBuilder.
             * separatorBuilder --> mirip itemBuilder, perlu context dan index
             *   -------------------tapi ada returnnya.
             */
      // body: ListView(
      //   // scrollDirection: Axis.horizontal, // ---> mengubah direction
      //   children: myList, // listnya bisa di-harcode atau ditaro di class.
      // )
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: myColor.length,
        itemBuilder: (context, index) {
          return Container(
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 +
                  200.0,
            ),
            height: 300,
            width: 300,
            color: myColor[index],
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(0.2),
            child: Text("Haaiiii!",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white)),
          );
        },
      ),
    ));
  }
}
