import 'package:flutter/material.dart';

const age = 28;

getFullName( firstName, String lastName){
  var names = firstName ?? lastName;
  return names;
}

String test(names){

  if (names == 'Foo') {
      String foundName = 'Foo Bar';
       
       return foundName;
  }
  else{
    String notFound = 'Ahan Vai Here';
    return notFound;
  }

}

class Person {
  final String name;
  Person(this.name);
  void run(){
    print('Running');
  }
  void breathe(){
    print('Breathing...');
  }
}

void testtwo(){
  final person = Person('Ahan Vai');

  person.run();
  person.breathe();
  print(person.name);

}

class dog{
  final String name;
  dog(this.name);

  factory dog.fluffball() {
    return dog('Fluff Ball');
  }

}

void dogTest(){
  final fluffball = dog('Fluff Ball');
  print(fluffball.name);
}

class tiger{
  final String name;
  tiger(this.name);

  @override
  bool operator ==(covariant tiger other) => other.name == name;
  
  @override
  int get hashCode => name.hashCode;

  
}

void tigerTest(){
  final tigerVai = tiger('Tiger One');
  final tigerVai2 = tiger('Tiger One');

  if(tigerVai == tigerVai2){
    print('Same Vai');
  }
  else{
    print('Not Same');
  }
}

class bird{
  final String name;
  bird(this.name);
}

extension fly on bird{
  void flying(){
    print('Bird $name is Flying');
  }
}

void birdTest(){
  final trials = bird('Parrot');
  trials.flying();
}

Future<int>alienFuture(int a){
  return Future.delayed(const Duration(seconds: 3), () {
    return a * 2;
  });
}

 alientester() async {
  final result = await alienFuture(10);
  print(result);
}

Stream <String> getAlienName(){
  return Stream.periodic(const Duration(seconds: 2), (value) {
    return 'Fooo';
  });
}

void nameTest() async{
  await for (final value in getAlienName()){
    print(value);
  }
}
 
Iterable<int> getOneTwoThree() sync*{
  yield 1;
  yield 2;
}

void iterableTest(){
  for (final value in getOneTwoThree()){
    print(value);
  }
}

// Generic Type ------------//
class GenericPair<A , B>{
  final A value1;
  final B value2;
  GenericPair(this.value1, this.value2);
}

void genericTest(){
  final nameee = GenericPair('Ahan', 'Vai Joss');
  print(nameee);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
    
      _counter++;
    });
  }

   void _decrementCounter() {
    setState(() {
   
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
     testtwo();
     dogTest();
     tigerTest();
     birdTest();
     alientester();
     iterableTest();
     genericTest();
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
   
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(getFullName(null, 'Doe')),
            Text(test('Foo')),
          ],
        ),
      ),
      
      floatingActionButton: Row(
        children: [
        Column(children: [FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add), 
      ), ],),
       Column(children: [FloatingActionButton(
        onPressed: _decrementCounter,
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      ), ],),
      ],
      )
    );
  }
}
