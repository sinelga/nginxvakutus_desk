import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:async';
import "package:js/js.dart" as js;
import "package:jsonp/jsonp.dart" as jsonp;
import 'domains.dart';
import 'package:intl/intl.dart';
import 'articlebox.dart';
//List forMarkList ;
@MirrorsUsed(targets: const ['domains'],override: '*')
import 'dart:mirrors';


@CustomTag('central-box')
class CentralBoxElement extends PolymerElement {
 
 final List forMarkList = toObservable(new List<ForMark>());
 ArticleBoxElement articleBoxElement;
 DivElement bigspinnerElement;
 DivElement articlesElement;
 

 bool get applyAuthorStyles => true;
 
  CentralBoxElement.created() : super.created() {
  this.hidden = true;
   
  getArticles("fi_FI","finances","Ulkomaat");
  bigspinnerElement =this.shadowRoot.querySelector('#bigspinner');
  articlesElement =this.shadowRoot.querySelector('#articles'); 
  
  }
    
  void showSelectedNavigation(String locale,String themes,String subthemes){

    bigspinnerElement.hidden = false;
    articlesElement.hidden = true;
    getArticles(locale,themes,subthemes);
    
    articleBoxElement.hideAll();
       
  }
   
  
  void getArticles(String locale,String themes,String subthemes) {
  
    Future<js.Proxy> result = jsonp.fetch(
        
        uri: "http://suomipornome2.appspot.com/jsonout?locale="+locale+"&themes="+themes+"&subthemes="+subthemes+"&callback=?"
                 
    );

    result.then((js.Proxy proxy) {
      
      display(proxy["results"]);

      this.hidden = false;
      
      
      bigspinnerElement.hidden = true;
      articlesElement.hidden = false;
      
      articleBoxElement=querySelector('#article-box');
      
    });
        
  }
  
 
  void display(var data){
    
    if (forMarkList.isNotEmpty) {
      
      forMarkList.clear();
      
    }
       
    for (var i=0;i < data.length;i++){
      
      var forMark = new ForMark();
      forMark.id = i;
      forMark.Title = data[i].Title;
      DateTime pubDate = DateTime.parse(data[i]["PubDate"]);
      var timeStamp = new DateFormat("d-MMM-yyyy");
      String pubDateStr = timeStamp.format(pubDate);
      forMark.PubDate = pubDateStr;
      forMark.Title = data[i]["Title"];
      String imglinkstr = data[i]["ImageLink"].replaceFirst("w=468","w=200");
      forMark.ImageLink = imglinkstr;
      forMark.Cont = data[i]["Cont"];
           
      forMarkList.add(forMark);
    }
    
    
  }
  void selectArticle(Event e){
    
    var id =  int.parse((e.currentTarget as Element).id);
    
    ForMark forMark = forMarkList[id];
//    this.hidden = true;
    bigspinnerElement.hidden = true;
    articlesElement.hidden = true;
    articleBoxElement.showArticle(forMark);
     
  }
  
  void showArticles(Event e){
    
//    this.hidden =false;
    bigspinnerElement.hidden = true;
    articlesElement.hidden = false;
        
  }
  
  
}