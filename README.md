# Stern-Brocot
Implementation of Stern-Brocot tree in Dart.

https://en.wikipedia.org/wiki/Stern%E2%80%93Brocot_tree

# Library
This pub exports the following symbols:
- `Mediant` - class representing rational number `p/q` with mediant operation support.
- `algo` - performs the Stern-Brocot algorithm performing up to `2^N` mediant operations.

# Example
1. Fork the project
2. `cd` into `stern_brocot`
3. Run `dart run`

```dart
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
```