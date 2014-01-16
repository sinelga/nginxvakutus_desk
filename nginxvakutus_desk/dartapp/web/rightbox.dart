import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:async';

DivElement adsElement;

@CustomTag('right-box')
class RightBoxElement extends PolymerElement {
  @published String adsstr;
//  @published DivElement adsElement;
  
  bool get applyAuthorStyles => true;
  RightBoxElement.created() : super.created() {
    
    adsElement = this.shadowRoot.querySelector('#ads');
    
    
    
    var adsstr = "<p>lslslslsl</p>";
//    adsstr="<script async src='//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js'></script><ins class='adsbygoogle' style='display:inline-block;width:180px;height:150px' data-ad-client='ca-pub-4265026941264081' data-ad-slot='9659344258'></ins> <script> (adsbygoogle = window.adsbygoogle || []).push({}); </script>";
    
    adsElement.setInnerHtml(adsstr, treeSanitizer: new NullTreeSanitizer());
    
//    adsElement.appendHtml(ads);
//    var timer = new Timer(const Duration(milliseconds: 6000), doStuffCallback);
    
  }
  
  void doStuffCallback() {
    
    adsstr="<script async src='//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js'></script><ins class='adsbygoogle' style='display:inline-block;width:180px;height:150px' data-ad-client='ca-pub-4265026941264081' data-ad-slot='9659344258'></ins> <script> (adsbygoogle = window.adsbygoogle || []).push({}); </script>";

    
    adsElement.setInnerHtml(adsstr, treeSanitizer: new NullTreeSanitizer());
    
  }
  
}

class NullTreeSanitizer implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {}
}