/// The mediant is a binary operation on two representation of fractions.
/// The resulting fraction is a rational number in reduced `p/q` form.
///
/// [isInfinity] is true when [denominator] is `0`.
/// [isZero] is true when [numerator] is `0`.
/// [value] returns the approximate real number representation, if valid.
///
/// The [operator+] has been provided to perform the operation a/b + c/d = a+c/b+d.
/// [toString] has been overloaded to print the fractional representation `p/q`.
///
/// [Mediant.zero] constructor returns an instance whose [isZero] is true.
/// [Mediant.inf] constructor returns an instance whose [isInfinity] is true.
class Mediant {
  final int numerator;
  final int denominator;

  bool get isInfinity => denominator == 0;
  bool get isZero => numerator == 0;
  double get value => numerator / denominator;

  Mediant(this.numerator, this.denominator);

  @override
  String toString() => '$numerator/$denominator';

  factory Mediant.zero() => Mediant(0, 1);
  factory Mediant.inf() => Mediant(1, 0);

  Mediant operator +(Mediant rhs) => Mediant(
        numerator + rhs.numerator,
        denominator + rhs.denominator,
      );
}

/// A Stern-Brocot tree generates all positive rational numbers.
/// The algorithm will perform `2^N-1` mediant operations where [order] is `N`.
/// The results will be a flat [List] of [Mediant] results.
List<Mediant> algo({required int order}) {
  final zero = Mediant.zero();
  final inf = Mediant.inf();

  return [zero, ..._sternBrocotImpl(zero, inf, order), inf];
}

/// The recursive descent implementation for the Stern-Brocot algorithm.
List<Mediant> _sternBrocotImpl(Mediant l, Mediant r, int order) {
  final m = l + r;

  if (order <= 0) return [];

  return [
    ..._sternBrocotImpl(l, m, order - 1),
    m,
    ..._sternBrocotImpl(m, r, order - 1),
  ];
}
