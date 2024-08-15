import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:interactive_nuzo_and_namia/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.baobabTree).existsSync(), isTrue);
    expect(File(Images.bean).existsSync(), isTrue);
    expect(File(Images.drum).existsSync(), isTrue);
    expect(File(Images.fabric).existsSync(), isTrue);
    expect(File(Images.grass2).existsSync(), isTrue);
    expect(File(Images.grass).existsSync(), isTrue);
    expect(File(Images.iceCream).existsSync(), isTrue);
    expect(File(Images.lion).existsSync(), isTrue);
    expect(File(Images.mango).existsSync(), isTrue);
    expect(File(Images.papaya).existsSync(), isTrue);
    expect(File(Images.rice).existsSync(), isTrue);
    expect(File(Images.sun).existsSync(), isTrue);
    expect(File(Images.trumpet).existsSync(), isTrue);
  });
}
