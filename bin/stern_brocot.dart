import 'package:stern_brocot/stern_brocot.dart' as stern_brocot;

void main() {
  for (int i = 0; i < 4; i++) {
    final out = stern_brocot.algo(order: i);
    print('order $i: $out');

    final reals = out.map((e) => e.value).toList();
    print('reals => $reals');

    // Seperator
    print('----------------');
  }
}
