import "package:unittest/unittest.dart";
import "package:unittest/html_config.dart";
import "package:dartmon/dartmon.dart";

void main() {
  useHtmlConfiguration();
  Map map = { 'complemento': 'de 2161 ao fim - lado ímpar',
              'bairro': 'Cerqueira César',
              'cidade': 'São Paulo',
              'logradouro': 'Alameda Santos',
              'estado_info': {'area_km2': '248.222,801',
                              'codigo_ibge': '35',
                              'nome': 'São Paulo'},
              'cep': '01419101',
              'cidade_info': {'area_km2': '1521,101',
                              'codigo_ibge': '3550308'},
              'estado': 'SP' };
  
  Postmon cep = new Postmon('01419101');
  test("BuscarCep returns the correct value", () {
    expect(cep.infos, equals(map));
  });
}