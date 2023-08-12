
import 'dart:io';

String readFixture(String jsonName) => File('test/fixtures/$jsonName').readAsStringSync();