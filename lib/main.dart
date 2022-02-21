import 'dart:convert' ;

import 'dart:async';

import 'package:http/http.dart' as http;


void main() async {

var headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Basic M2lwY3VuZnY5bGJhOjB5OWp5d3FpZXBkOQ=='
};
var request = http.Request('POST', Uri.parse('https://otpapi.worldhubcom.com/api/mcotp/send'));
request.body = json.encode({
  "to": "62967888000",
  "length": 6,
  "tag": "compaign1",
  "timeout": 300,
  "notifyurl": ""
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}


}
