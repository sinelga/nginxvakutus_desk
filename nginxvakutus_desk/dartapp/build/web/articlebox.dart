import 'package:polymer/polymer.dart';
import 'dart:html';
import 'domains.dart';
import 'centralbox.dart';

@CustomTag('article-box')
class ArticleBoxElement extends PolymerElement with ChangeNotifier  {
  
  @reflectable @published String get imglink => __$imglink; String __$imglink; @reflectable set imglink(String value) { __$imglink = notifyPropertyChange(#imglink, __$imglink, value); }
  @reflectable @published String get title => __$title; String __$title; @reflectable set title(String value) { __$title = notifyPropertyChange(#title, __$title, value); }
  @reflectable @published String get cont => __$cont; String __$cont; @reflectable set cont(String value) { __$cont = notifyPropertyChange(#cont, __$cont, value); }
  
  CentralBoxElement centralBoxElement;
  
  bool get applyAuthorStyles => true;
  
  ArticleBoxElement.created() : super.created() {
    
    this.hidden = true;
    centralBoxElement = querySelector('#central-box');  
  }
  
  void showArticle(ForMark forMark){
     
    imglink = forMark.ImageLink.replaceFirst("w=200","w=468");
    title = forMark.Title;
    cont = forMark.Cont;
    
    this.hidden = false;
    
  }
  
  void closeArticle(Event e){
      
    this.hidden = true;
    centralBoxElement.showArticles(e);
       
  }
  
  void hideAll() {
    
    this.hidden = true;
    
  }
  
  
}