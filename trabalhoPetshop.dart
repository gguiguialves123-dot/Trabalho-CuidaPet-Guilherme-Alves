import 'dart:io';

void main() {

  int totalVendas = 0;
  double valorTotalVendas = 0;

  while (true) {

    print("\nBem vindo ao autoatendimento do CuidaPet");
    print("Digite seu nome:");
    String nome = stdin.readLineSync()!;

    // Área restrita
    if (nome == "cuidapetrestrito") {

      double valorVenda = areaRestrita();

      totalVendas++;
      valorTotalVendas += valorVenda;

      continue;
    }

    List<String> carrinho = [];
    List<double> valores = [];

    while (true) {

      int opcao = menuPrincipal();

      // Encerrar sistema
      if (opcao == 0) {
        encerrarSistema(totalVendas, valorTotalVendas);
        return;
      }

      switch (opcao) {

        case 1:
          menuPromocoes(carrinho, valores);
          break;

        case 2:
          menuServicos(carrinho, valores);
          break;

        case 3:
          listarCarrinho(carrinho, valores);
          break;

        case 4:

          double total = finalizarCompra(valores);

          totalVendas++;
          valorTotalVendas += total;

          carrinho.clear();
          valores.clear();

          break;

        default:
          print("\nOpção inválida.");
      }
    }
  }
}

// MENU PRINCIPAL
int menuPrincipal() {

  print("\n------- MENU -------");
  print("1 - Ver promoções");
  print("2 - Solicitar serviço");
  print("3 - Listar carrinho de compra");
  print("4 - Finalizar carrinho de compra");
  print("0 - Sair");

  print("Digite sua opção desejada:");
  return int.parse(stdin.readLineSync()!);
}

// PROMOÇÕES
void menuPromocoes(List<String> carrinho, List<double> valores) {

  while (true) {

    print("\n--- PROMOÇÕES ---");
    print("101 - Ração Royal Canin - R\$ 290,00");
    print("102 - Ração Royal Canin para Gatos - R\$ 492,00");
    print("103 - Bifinho Keldog - R\$ 23,92");
    print("104 - Fraldas Descartáveis - R\$ 38,61");
    print("8 - Adicionar ao carrinho");
    print("0 - Voltar");

    int op = int.parse(stdin.readLineSync()!);

    if (op == 0) {
      break;
    }

    if (op == 8) {

      if (carrinho.length >= 3) {
        print("\nCarrinho cheio.");
        continue;
      }

      print("Digite o código do produto:");
      int cod = int.parse(stdin.readLineSync()!);

      switch (cod) {

        case 101:
          carrinho.add("Ração Royal Canin");
          valores.add(290);
          break;

        case 102:
          carrinho.add("Ração Gatos");
          valores.add(492);
          break;

        case 103:
          carrinho.add("Bifinho Keldog");
          valores.add(23.92);
          break;

        case 104:
          carrinho.add("Fraldas Descartáveis");
          valores.add(38.61);
          break;

        default:
          print("Código inválido");
      }
    }
  }
}

// SERVIÇOS
void menuServicos(List<String> carrinho, List<double> valores) {

  while (true) {

    print("\n--- SERVIÇOS ---");
    print("201 - Banho e tosa - R\$ 55,99");
    print("202 - Tosa higiênica - R\$ 12,99");
    print("203 - Hidratação dos pelos - R\$ 20,99");
    print("8 - Adicionar ao carrinho");
    print("0 - Voltar");

    int op = int.parse(stdin.readLineSync()!);

    if (op == 0) {
      break;
    }

    if (op == 8) {

      if (carrinho.length >= 3) {
        print("\nCarrinho cheio.");
        continue;
      }

      print("Digite o código do serviço:");
      int cod = int.parse(stdin.readLineSync()!);

      switch (cod) {

        case 201:
          carrinho.add("Banho e tosa");
          valores.add(55.99);
          break;

        case 202:
          carrinho.add("Tosa higiênica");
          valores.add(12.99);
          break;

        case 203:
          carrinho.add("Hidratação dos pelos");
          valores.add(20.99);
          break;

        default:
          print("Código inválido");
      }
    }
  }
}

// LISTAR CARRINHO
void listarCarrinho(List<String> carrinho, List<double> valores) {

  print("\n--- CARRINHO DE COMPRAS ---");

  if (carrinho.isEmpty) {

    print("Carrinho vazio.");

  } else {

    for (int i = 0; i < carrinho.length; i++) {
      print("${carrinho[i]} - R\$ ${valores[i]}");
    }
  }
}

// FINALIZAR COMPRA
double finalizarCompra(List<double> valores) {

  double total = 0;

  for (double v in valores) {
    total += v;
  }

  print("Forma de pagamento (D - dinheiro / C - cartão):");
  String forma = stdin.readLineSync()!;

  if (forma == "D" || forma == "d") {
    total = total * 0.9;
  }

  print("Valor final a pagar: R\$ ${total.toStringAsFixed(2)}");

  return total;
}

// ÁREA RESTRITA
double areaRestrita() {

  print("\n--- ÁREA RESTRITA ---");

  print("Digite o nome do cliente:");
  String nomeCliente = stdin.readLineSync()!;

  print("Digite o valor gasto:");
  double valor = double.parse(stdin.readLineSync()!);

  print("Forma de pagamento (D - dinheiro / C - cartão):");
  String forma = stdin.readLineSync()!;

  double valorFinal = valor;

  if (forma == "D" || forma == "d") {
    valorFinal = valor * 0.9;
  }

  print("\nCliente: $nomeCliente");
  print("Valor final: R\$ ${valorFinal.toStringAsFixed(2)}");

  return valorFinal;
}

// ENCERRAR SISTEMA
void encerrarSistema(int totalVendas, double valorTotalVendas) {

  print("\nEncerrando sistema...");
  print("Quantidade de vendas: $totalVendas");
  print("Valor total das vendas: R\$ ${valorTotalVendas.toStringAsFixed(2)}");
}