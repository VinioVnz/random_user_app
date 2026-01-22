import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderTraduction {

  static Map<String,IconData> genderTraduction (String gender){
    if (gender == 'female') return {'Feminino' : FontAwesomeIcons.venus};

    return {'Masculino' : FontAwesomeIcons.mars};
  }
}
