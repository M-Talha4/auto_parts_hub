import 'package:flutter/widgets.dart';

// font weights
FontWeight bold = FontWeight.bold;
FontWeight normal = FontWeight.normal;
FontWeight bold3 = FontWeight.w300;
FontWeight bold6 = FontWeight.w600;
FontWeight bold1 = FontWeight.w100;
FontWeight bold2 = FontWeight.w200;
FontWeight bold4 = FontWeight.w400;
FontWeight bold5 = FontWeight.w500;
FontWeight bold7 = FontWeight.w700;
FontWeight bold8 = FontWeight.w800;
FontWeight bold9 = FontWeight.w900;



class AppStyle {

 static const double _referenceScreenWidth = 393.0;

  static const double _defaultRadius = 12;
  static const double _defaultPadding = 25;


  
  // font sizes

    static const double _headingsize = 24;
        static const double _subheadingsize = 18;

    static const double _bodysize = 16;

    static const double  _smallsize = 14;

    



static double defaultPadding(BuildContext context){
  return _adaptiveFontSize(context, _defaultPadding);
}

static double defaultRadius(BuildContext context){
  return _adaptiveFontSize(context, _defaultRadius);
}


static double size(BuildContext context,double size){
  return _adaptiveFontSize(context, size);
}



static double headingsize(BuildContext context){
  return _adaptiveFontSize(context, _headingsize);
}

static double subheadingsize(BuildContext context){
  return _adaptiveFontSize(context, _subheadingsize);
}


static double bodysize(BuildContext context){
  return _adaptiveFontSize(context, _bodysize);
}


static double smallsize(BuildContext context){
  return _adaptiveFontSize(context, _smallsize);
}





  // defint you sizes





//   static TextStyle headingStyle(BuildContext context) {
//     return 
//     GoogleFonts.lato(
//     textStyle: TextStyle(
      
      
//        fontSize: _adaptiveFontSize(context, _headingsize),
//       fontWeight: bold4
//       ),
//   );
    
    
    
//   }





// static TextStyle subheadingStyle(BuildContext context) {
//     return 
//     GoogleFonts.lato(
//     textStyle: TextStyle(
      
      
//        fontSize: _adaptiveFontSize(context, _headingsize),
//       fontWeight: bold4
//       ),
//   );
    
    
    
//   }
  


// static TextStyle bodyStyle(BuildContext context) {
//     return 
//     GoogleFonts.lato(
//     textStyle: TextStyle(
      
      
//        fontSize: _adaptiveFontSize(context, _headingsize),
//       fontWeight: bold4
//       ),
//   );
    
    
    
//   }



// static TextStyle smallStyle(BuildContext context) {
//     return 
//     GoogleFonts.lato(
//     textStyle: TextStyle(
      
      
//        fontSize: _adaptiveFontSize(context, _headingsize),
//       fontWeight: bold4
//       ),
//   );
    
    
    
//   }
  




  static double _adaptiveFontSize(BuildContext context, double fontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (fontSize * screenWidth) /_referenceScreenWidth;
  }




  
  





}

 






