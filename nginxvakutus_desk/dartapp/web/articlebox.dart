import 'package:polymer/polymer.dart';
import 'dart:html';
import 'domains.dart';
import 'centralbox.dart';

@CustomTag('article-box')
class ArticleBoxElement extends PolymerElement {
  
  @published String imglink;
  @published String title;
  @published String cont;
  
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