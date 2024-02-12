import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment(){
    _counter++;
    notifyListeners();
  }
}
void main() {
     runApp(
      ChangeNotifierProvider(
        create: (context)=> CounterProvider(),
        child: MyApp(),
  ),
     );
}
// consume the provider in widget
class MyWidget extends   StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counterProvider, child){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter: ${counterProvider.counter}'),
              ElevatedButton(onPressed:(){
                counterProvider.increment();
              },
              child: Text('Increment'),
              )
            ],
          )
          );
      },
    );
  }
}
//this is my comment
//second comment
class MyApp extends  StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider Example'),
        ),
        body: MyWidget(),
        ),
      );
  }
  }
