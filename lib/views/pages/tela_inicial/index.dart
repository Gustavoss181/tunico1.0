import 'dart:async';
import 'dart:ui';
import 'package:bicjr_app/routes/app_routes.dart';
import 'package:bicjr_app/views/components/slide.dart';
import 'package:bicjr_app/views/components/slide_dots.dart';
import 'package:bicjr_app/views/components/slide_item.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int _currentPage=0;
  final PageController _pageController= PageController(
    initialPage: 0
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer){
      //print(_currentPage);

      _currentPage < 2 ? _currentPage++ : _currentPage = 0;

      try{
        _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn
      );}
      catch(ex){
        
      }
    });

  }
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index){
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: slideList.length,
                    itemBuilder: (ctx, i) => SlideItem(i),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for(int i =0; i<slideList.length; i++)
                            if(i==_currentPage)
                            SlideDots(true)
                            else
                            SlideDots(false)
                          ],
                        ),
                      )
                    ],
                  )
                ],
                              
              ),
               ),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                FlatButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.CADASTRO);
                },
                child:Text('Cadastre-se!', style: TextStyle(fontSize: 18),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                padding: const EdgeInsets.all(15),
                color: Color.fromARGB(247, 247, 107, 107),
                textColor: Colors.white,

                 ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text('Já possui uma conta?', style: TextStyle(fontSize: 15,),),
                  FlatButton(onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.LOGIN);
                  }, 
                  child: Text('Entrar.',style: TextStyle(fontSize: 15, )),),
                ])
              ],)
            ],
          ),
        ),
      ),
    );
  }
}