import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'CONTROLE DE ACESSO',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 30,
              color: const Color(0xfffcfeff),
              letterSpacing: 0.75,
              fontWeight: FontWeight.w900,
              height: 1.9,
            ),
          ),
        ],
      ),
    );
  }
}
