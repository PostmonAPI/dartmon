library dartmon;

import "dart:html";
import "dart:convert" show JSON;

class Postmon {
  Map _infos;
  String _host;
  var _request;
  var _url;
  String _cep;
  
  Postmon(this._cep) {
    this._host = "http://api.postmon.com.br/v1";
    this._url = this._host + "/cep/" + this._cep;
    HttpRequest request = new HttpRequest();
    request.open('GET', this._url, async:false);
    request.send();
    onJsonObject(request.responseText);
  }
  
  Map get infos => this._infos;
  
  onJsonObject(String jsonString) {
    this._infos = JSON.decode(jsonString);
  }
}