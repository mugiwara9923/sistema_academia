import 'aluno.dart';
import 'plano.dart';

class Matricula {
  Aluno aluno;
  Plano plano;
  DateTime dataInicio;
  DateTime dataVencimento;

  Matricula(
    this.aluno,
    this.plano,
    this.dataInicio,
    this.dataVencimento,
  );
}