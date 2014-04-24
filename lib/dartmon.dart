// Copyright (c) 2014, The Postmon API Team.
// This source code is governed by an Apache-style
// license and more information can be found 
// in the README.md file.

/**
 * Wrapper to help dart developers use the Postmon API
 */
library dartmon;

import "dart:html";
import "dart:convert" show JSON;

/**
 * A class to help dart developers use the Postmon API
 * 
 * More information about the Postmon API can be found
 * at [project page](http://postmon.com.br)
 * 
 * ### Use
 * 
 *      import "package:dartmon/dartmon.dart";
 *      
 *      main() {
 *        Postmon postmon = new Postmon("cep_to_find_here");
 *        print(postmon.infos);
 *      }
 *      
 * ## ToDo
 * 
 * * Function to use tracking API's method
 * * Improve unittests
 * * Remove the "dart:html" dependency
 */
class Postmon {
  Map _infos;
  String _host;
  var _request;
  var _url;
  String _cep;
  
  /// Creates a new Postmon instance with the JSON response
  Postmon(this._cep) {
    this._host = "http://api.postmon.com.br/v1";
    this._url = this._host + "/cep/" + this._cep;
    HttpRequest request = new HttpRequest();
    request.open('GET', this._url, async:false);
    request.send();
    onJsonObject(request.responseText);
  }
  
  /// Return all the informations about the CEP
  Map get infos => this._infos;
  
  /// Only decode the String response in a Map
  /// and populate the variable
  onJsonObject(String jsonString) {
    this._infos = JSON.decode(jsonString);
  }
}