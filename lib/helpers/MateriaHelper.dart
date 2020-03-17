import 'package:intl/intl.dart';



class Materia {
  Materia(Map<String, String> map, int indiceDia) {
    // mapaDasAulas = {"Aula": "", "Turma": "", "Dias/Horarios": "", "Ministrantes": "", "Operacoes": ""};
    this.codigo = map["Aula"].split("-")[0].replaceAll(' ', '');
    this.nome = map["Aula"].split("- ")[1].replaceAll("\n", "");
    this.turma = map["Turma"].replaceAll("\n", "").replaceAll(" ", "");
    this.ministrantes = map["Ministrantes"];
    var aux = map["Dias/Horarios"].split(")")[indiceDia] + ")";
    this.dia = aux.split(".")[0].replaceAll(" ", "").replaceAll("\n", "");
    this.horaI = aux.split(".")[1].split(" às ")[0].replaceAll(" ", "").replaceAll("\n", "");
    this.horaF = aux.split(" às ")[1].split(" (")[0].replaceAll(" ", "").replaceAll("\n", "");
    this.local = aux.split("(")[1].split(")")[0].replaceAll("\n", "");
  }


  String codigo, nome, dia, horaI, horaF, turma, ministrantes, local;

  int toint() {
    var x = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];
    var y = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"];
    DateTime today = DateTime.now();
    String f = new DateFormat('EEEE').format(today);
    return  (y.indexOf(this.dia.replaceAll(" ", ""))- x.indexOf(f)<0?y.indexOf(this.dia.replaceAll(" ", ""))- x.indexOf(f)+7:y.indexOf(this.dia.replaceAll(" ", ""))- x.indexOf(f))*10000+int.parse(this.horaI.split(":")[0]) * 100 +
        int.parse(this.horaI.split(":")[1]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return codigo +
        " - " +
        nome +
        "\n" +
        dia +
        " - " +
        horaI +
        " às " +
        horaF +
        "\nlocal: " +
        local +
        "\n turma " +
        turma +
        "\n ministrantes :\n" +
        ministrantes +
        "\n";
  }


}