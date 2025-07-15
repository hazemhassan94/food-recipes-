import '../datasource/advice_remote_datasource.dart';

class AdviceRepo {
  final AdviceRemoteDatasource datasource;
  AdviceRepo(this.datasource);

  Future<String> fetchAdvice() async {
    return await datasource.getRandomAdvice();
}
}