sealed class Result<F, S> {
  const Result();
}

class Success<F, S> extends Result<F, S> {
  const Success({required this.successRes});

  final S successRes;
}

class Failure<F, S> extends Result<F, S> {
  const Failure({required this.failureRes});

  final F failureRes;
}