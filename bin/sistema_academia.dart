import 'dart:io';

import 'aluno.dart';
import 'plano.dart';
import 'modalidade.dart';
import 'instrutor.dart';
import 'matricula.dart';
import 'acesso.dart';

void main() {
  List<Aluno> alunos = [];
  List<Plano> planos = [];
  List<Modalidade> modalidades = [];
  List<Instrutor> instrutores = [];
  List<Matricula> matriculas = [];
  List<Acesso> acessos = [];

  String? opcao;

  while (opcao != '0') {
    print('================================');
    print('       SISTEMA DE ACADEMIA');
    print('================================');
    print('1 - Cadastrar aluno');
    print('2 - Listar alunos');
    print('3 - Alterar aluno');
    print('4 - Excluir aluno');
    print('5 - Cadastrar plano');
    print('6 - Listar planos');
    print('7 - Cadastrar modalidade');
    print('8 - Listar modalidades');
    print('9 - Cadastrar instrutor');
    print('10 - Listar instrutores');
    print('11 - Cadastrar matrícula');
    print('12 - Listar matrículas');
    print('13 - Registrar acesso');
    print('14 - Listar acessos');
    print('15 - Relatório de matrículas vencidas');
    print('16 - Relatório de acessos por período');
    print('0 - Sair');

    stdout.write('Escolha uma opção: ');
    opcao = stdin.readLineSync();

    if (opcao == '1') {
      String nome = '';

      while (nome.trim().isEmpty) {
        stdout.write('Digite o nome do aluno: ');
        nome = stdin.readLineSync() ?? '';

        if (nome.trim().isEmpty) {
          print('O nome não pode ficar vazio.');
        }
      }

      String cpf = '';

      while (cpf.length != 11 || int.tryParse(cpf) == null) {
        stdout.write('Digite o CPF (11 números): ');
        cpf = stdin.readLineSync() ?? '';

        if (cpf.length != 11 || int.tryParse(cpf) == null) {
          print('CPF inválido. Digite exatamente 11 números.');
        }
      }

      bool cpfJaCadastrado = false;

      for (Aluno aluno in alunos) {
        if (aluno.cpf == cpf) {
          cpfJaCadastrado = true;
          break;
        }
      }

      if (cpfJaCadastrado) {
        print('Já existe um aluno cadastrado com esse CPF.');
      } else {
        String telefone = '';

        while (telefone.length < 10 ||
            int.tryParse(telefone) == null) {
          stdout.write('Digite o telefone: ');
          telefone = stdin.readLineSync() ?? '';

          if (telefone.length < 10 ||
              int.tryParse(telefone) == null) {
            print(
              'Telefone inválido. Digite pelo menos 10 números.',
            );
          }
        }

        Aluno novoAluno = Aluno(nome, cpf, telefone);

        alunos.add(novoAluno);

        print('Aluno cadastrado com sucesso!');
      }
    }

    if (opcao == '2') {
      if (alunos.isEmpty) {
        print('Nenhum aluno cadastrado.');
      } else {
        print('===== ALUNOS CADASTRADOS =====');

        for (Aluno aluno in alunos) {
          print('Nome: ${aluno.nome}');
          print('CPF: ${aluno.cpf}');
          print('Telefone: ${aluno.telefone}');
          print('------------------------------');
        }
      }
    }

    if (opcao == '3') {
      if (alunos.isEmpty) {
        print('Nenhum aluno cadastrado.');
      } else {
        stdout.write('Digite o CPF do aluno que deseja alterar: ');
        String cpf = stdin.readLineSync()!;

        bool encontrado = false;

        for (Aluno aluno in alunos) {
          if (aluno.cpf == cpf) {
            encontrado = true;

            stdout.write('Digite o novo nome: ');
            aluno.nome = stdin.readLineSync()!;

            stdout.write('Digite o novo telefone: ');
            aluno.telefone = stdin.readLineSync()!;

            print('Aluno alterado com sucesso!');

            break;
          }
        }

        if (!encontrado) {
          print('Aluno não encontrado.');
        }
      }
    }

    if (opcao == '4') {
      if (alunos.isEmpty) {
        print('Nenhum aluno cadastrado.');
      } else {
        stdout.write('Digite o CPF do aluno que deseja excluir: ');
        String cpf = stdin.readLineSync()!;

        bool encontrado = false;

        for (Aluno aluno in alunos) {
          if (aluno.cpf == cpf) {
            encontrado = true;

            alunos.remove(aluno);

            print('Aluno excluído com sucesso!');

            break;
          }
        }

        if (!encontrado) {
          print('Aluno não encontrado.');
        }
      }
    }

    if (opcao == '5') {
      stdout.write('Digite o nome do plano: ');
      String nome = stdin.readLineSync()!;

      stdout.write('Digite o valor do plano: ');
      double valor = double.parse(stdin.readLineSync()!);

      stdout.write('Digite a duração do plano em dias: ');
      int duracaoDias = int.parse(stdin.readLineSync()!);

      Plano novoPlano = Plano(
        nome,
        valor,
        duracaoDias,
      );

      planos.add(novoPlano);

      print('Plano cadastrado com sucesso!');
    }

    if (opcao == '6') {
      if (planos.isEmpty) {
        print('Nenhum plano cadastrado.');
      } else {
        print('===== PLANOS CADASTRADOS =====');

        for (Plano plano in planos) {
          print('Nome: ${plano.nome}');
          print('Valor: R\$ ${plano.valor}');
          print('Duração: ${plano.duracaoDias} dias');
          print('------------------------------');
        }
      }
    }

    if (opcao == '7') {
      stdout.write('Digite o nome da modalidade: ');
      String nome = stdin.readLineSync()!;

      stdout.write('Digite o horário da modalidade: ');
      String horario = stdin.readLineSync()!;

      Modalidade novaModalidade = Modalidade(
        nome,
        horario,
      );

      modalidades.add(novaModalidade);

      print('Modalidade cadastrada com sucesso!');
    }

    if (opcao == '8') {
      if (modalidades.isEmpty) {
        print('Nenhuma modalidade cadastrada.');
      } else {
        print('===== MODALIDADES CADASTRADAS =====');

        for (Modalidade modalidade in modalidades) {
          print('Nome: ${modalidade.nome}');
          print('Horário: ${modalidade.horario}');
          print('------------------------------');
        }
      }
    }

    if (opcao == '9') {
      stdout.write('Digite o nome do instrutor: ');
      String nome = stdin.readLineSync()!;

      stdout.write('Digite a especialidade: ');
      String especialidade = stdin.readLineSync()!;

      Instrutor novoInstrutor = Instrutor(
        nome,
        especialidade,
      );

      instrutores.add(novoInstrutor);

      print('Instrutor cadastrado com sucesso!');
    }

    if (opcao == '10') {
      if (instrutores.isEmpty) {
        print('Nenhum instrutor cadastrado.');
      } else {
        print('===== INSTRUTORES CADASTRADOS =====');

        for (Instrutor instrutor in instrutores) {
          print('Nome: ${instrutor.nome}');
          print('Especialidade: ${instrutor.especialidade}');
          print('------------------------------');
        }
      }
    }

    if (opcao == '11') {
      if (alunos.isEmpty) {
        print('Cadastre um aluno primeiro.');
      } else if (planos.isEmpty) {
        print('Cadastre um plano primeiro.');
      } else {
        print('===== ALUNOS =====');

        for (int i = 0; i < alunos.length; i++) {
          print('${i + 1} - ${alunos[i].nome}');
        }

        stdout.write('Escolha o número do aluno: ');
        int numeroAluno = int.parse(stdin.readLineSync()!);

        Aluno alunoEscolhido = alunos[numeroAluno - 1];

        print('');
        print('===== PLANOS =====');

        for (int i = 0; i < planos.length; i++) {
          print(
            '${i + 1} - ${planos[i].nome} - R\$ ${planos[i].valor}',
          );
        }

        stdout.write('Escolha o número do plano: ');
        int numeroPlano = int.parse(stdin.readLineSync()!);

        Plano planoEscolhido = planos[numeroPlano - 1];

        DateTime dataInicio = DateTime.now();

        DateTime dataVencimento =
            dataInicio.add(
          Duration(days: planoEscolhido.duracaoDias),
        );

        Matricula novaMatricula = Matricula(
          alunoEscolhido,
          planoEscolhido,
          dataInicio,
          dataVencimento,
        );

        matriculas.add(novaMatricula);

        print('Matrícula realizada com sucesso!');
        print('Data de início: $dataInicio');
        print('Data de vencimento: $dataVencimento');
      }
    }

    if (opcao == '12') {
      if (matriculas.isEmpty) {
        print('Nenhuma matrícula cadastrada.');
      } else {
        print('===== MATRÍCULAS =====');

        for (Matricula matricula in matriculas) {
          print('Aluno: ${matricula.aluno.nome}');
          print('Plano: ${matricula.plano.nome}');
          print('Data de início: ${matricula.dataInicio}');
          print('Data de vencimento: ${matricula.dataVencimento}');
          print('------------------------------');
        }
      }
    }

    if (opcao == '13') {
      if (alunos.isEmpty) {
        print('Nenhum aluno cadastrado.');
      } else {
        print('===== ALUNOS =====');

        for (int i = 0; i < alunos.length; i++) {
          print('${i + 1} - ${alunos[i].nome}');
        }

        stdout.write('Escolha o número do aluno: ');
        int numeroAluno = int.parse(stdin.readLineSync()!);

        Aluno alunoEscolhido = alunos[numeroAluno - 1];

        DateTime dataHora = DateTime.now();

        Acesso novoAcesso = Acesso(
          alunoEscolhido,
          dataHora,
        );

        acessos.add(novoAcesso);

        print('Acesso registrado com sucesso!');
        print('Data e hora: $dataHora');
      }
    }

    if (opcao == '14') {
      if (acessos.isEmpty) {
        print('Nenhum acesso registrado.');
      } else {
        print('===== ACESSOS =====');

        for (Acesso acesso in acessos) {
          print('Aluno: ${acesso.aluno.nome}');
          print('Data e hora: ${acesso.dataHora}');
          print('------------------------------');
        }
      }
    }

    if (opcao == '15') {
      if (matriculas.isEmpty) {
        print('Nenhuma matrícula cadastrada.');
      } else {
        DateTime hoje = DateTime.now();

        bool encontrou = false;

        print('===== MATRÍCULAS VENCIDAS =====');

        for (Matricula matricula in matriculas) {
          if (matricula.dataVencimento.isBefore(hoje)) {
            encontrou = true;

            print('Aluno: ${matricula.aluno.nome}');
            print('Plano: ${matricula.plano.nome}');
            print(
              'Data de vencimento: ${matricula.dataVencimento}',
            );
            print('------------------------------');
          }
        }

        if (!encontrou) {
          print('Nenhuma matrícula vencida.');
        }
      }
    }

    if (opcao == '16') {
      if (acessos.isEmpty) {
        print('Nenhum acesso registrado.');
      } else {
        stdout.write('Digite a data inicial (dd/mm/aaaa): ');
        String dataInicialTexto = stdin.readLineSync()!;

        stdout.write('Digite a data final (dd/mm/aaaa): ');
        String dataFinalTexto = stdin.readLineSync()!;

        List<String> partesInicial =
            dataInicialTexto.split('/');

        List<String> partesFinal =
            dataFinalTexto.split('/');

        if (partesInicial.length != 3 ||
            partesFinal.length != 3) {
          print('Data inválida. Use o formato dd/mm/aaaa.');
        } else {
          int diaInicial = int.parse(partesInicial[0]);
          int mesInicial = int.parse(partesInicial[1]);
          int anoInicial = int.parse(partesInicial[2]);

          int diaFinal = int.parse(partesFinal[0]);
          int mesFinal = int.parse(partesFinal[1]);
          int anoFinal = int.parse(partesFinal[2]);

          DateTime dataInicial = DateTime(
            anoInicial,
            mesInicial,
            diaInicial,
          );

          DateTime dataFinal = DateTime(
            anoFinal,
            mesFinal,
            diaFinal,
            23,
            59,
            59,
          );

          bool encontrou = false;

          print('===== ACESSOS NO PERÍODO =====');

          for (Acesso acesso in acessos) {
            if (acesso.dataHora.isAfter(dataInicial) &&
                acesso.dataHora.isBefore(dataFinal)) {
              encontrou = true;

              print('Aluno: ${acesso.aluno.nome}');
              print('Data e hora: ${acesso.dataHora}');
              print('------------------------------');
            }
          }

          if (!encontrou) {
            print('Nenhum acesso encontrado nesse período.');
          }
        }
      }
    }

    print('');
  }

  print('Sistema encerrado.');
}