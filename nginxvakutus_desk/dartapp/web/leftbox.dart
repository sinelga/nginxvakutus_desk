import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:async';
import "package:js/js.dart" as js;
import "package:jsonp/jsonp.dart" as jsonp;
import 'domains.dart';
import 'centralbox.dart';
//import 'articlebox.dart';
//import 'package:intl/intl.dart';
//List forMarkList ;

@CustomTag('left-box')
class LeftBoxElement extends PolymerElement {
  CentralBoxElement centralBoxElement;
//  ArticleBoxElement articleBoxElement; 

 final List<Navigation> navigationList = toObservable(new List<Navigation>());
  
  bool get applyAuthorStyles => true;
  
  LeftBoxElement.created() : super.created() {
  this.hidden = true;

  
  Future<js.Proxy> result = jsonp.fetch(
      
      uri: "http://suomipornome2.appspot.com/start?callback=?"
        
  );

  result.then((js.Proxy proxy) {

    display(proxy["results"]);

    this.hidden = false;
    centralBoxElement = querySelector('#central-box');
//    articleBoxElement = querySelector('#article-box');
    
  });
  }

  void display(var data) {
    
    for (var i=0;i < data.length;i++){
      
      Navigation navigation = new Navigation();
      
      navigation.id = i;
      navigation.Locale = data[i]["Locale"];
      navigation.Themes = data[i]["Themes"];
      navigation.SubThemes = data[i]["SubThemes"];
            
      navigationList.add(navigation);
    }
    
    
  }

  void selectNavigation(Event e){
    
    var id =  int.parse((e.currentTarget as Element).id);
    print(id);
    
    String locale = navigationList[id].Locale;
    String themes = navigationList[id].Themes;
    String subthemes = navigationList[id].SubThemes;
    
    centralBoxElement.showSelectedNavigation(locale,themes,subthemes);
    
  }
  
  
}