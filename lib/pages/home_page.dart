import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/models/tarefa.dart';
import 'package:to_do_list/repository/tarefa_repository.dart';
import 'package:to_do_list/shared/custom_widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var descricaoController = TextEditingController(text: "");
  var tarefaRepository = TarefaRepository();
  var _tarefas = const <Tarefa>[];

  bool apenasNaoConcluidos = false;
  bool apenasConcluidos = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    if (apenasNaoConcluidos) {
      _tarefas = await tarefaRepository.listarTarefasNaoConcluidas();
    } else if (apenasConcluidos) {
      _tarefas = await tarefaRepository.listarTarefasConcluidas();
    } else {
      _tarefas = await tarefaRepository.listarTarefas();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF80F78),
        title: const Text(
          'TaskBox',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFF80F78),
        onPressed: () {
          // Limpar o texto:
          descricaoController.text = "";
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  alignment: Alignment.center,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  title: Text(
                    "Nova tarefa:",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w700),
                  ),
                  content: TextField(
                    // Controller:
                    controller: descricaoController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 0.0),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF3FAEdB))),
                      labelText: 'Cadastre uma tarefa',
                      labelStyle: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: "Pagar conta de luz",
                      hintStyle: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    cursorColor: const Color(0xFFF80F78),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancelar",
                          style: GoogleFonts.roboto(
                              color: const Color(0xFF272727), fontSize: 18),
                        )),
                    // Cadastrar tarefa:
                    TextButton(
                        onPressed: () async {
                          await tarefaRepository.adicionar(
                              Tarefa(descricaoController.text, false));
                          if (mounted) {
                            Navigator.pop(context);
                          }
                          setState(() {});
                        },
                        child: Text(
                          "Adicionar",
                          style: GoogleFonts.roboto(
                              color: const Color(0xFFF80F78), fontSize: 18),
                        ))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Apenas não concluídas:',
                    style: GoogleFonts.roboto(
                        fontSize: 18, color: const Color(0xFF272727)),
                  ),
                  Switch(
                      activeColor: const Color(0xFFF80F78),
                      value: apenasNaoConcluidos,
                      onChanged: (bool value) {
                        apenasNaoConcluidos = value;
                        setState(() {
                          obterTarefas();
                        });
                      }),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Apenas concluídas:',
                    style: GoogleFonts.roboto(
                        fontSize: 18, color: const Color(0xFF272727)),
                  ),
                  Switch(
                      activeColor: const Color(0xFFF80F78),
                      value: apenasConcluidos,
                      onChanged: (bool value) {
                        apenasConcluidos = value;
                        setState(() {
                          obterTarefas();
                        });
                      }),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (BuildContext context, int index) {
                  var tarefa = _tarefas[index];
                  return CheckboxListTile(
                    title: Text(tarefa.descricao),
                    value: tarefa.concluido,
                    onChanged: (value) async {
                      await tarefaRepository.alterar(tarefa.id, value!);
                      obterTarefas();
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: const Color(0xFFF80F78),
                    secondary: IconButton(
                      icon: const Icon(Icons.delete_outline_outlined),
                      onPressed: () {
                        tarefaRepository.remover(tarefa.id);
                        obterTarefas();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
