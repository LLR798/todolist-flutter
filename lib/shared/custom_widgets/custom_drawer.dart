import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/pages/login_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // Checkbox:
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF5F5F5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext context) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text('Camera'),
                          leading: const Icon(Icons.camera_alt_outlined),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text('Galeria'),
                          leading: const Icon(Icons.photo_album_outlined),
                        ),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFFF80F78),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: const Color(0xFFF5F5F5),
                  child: Text(
                    'LLR',
                    style: GoogleFonts.roboto(
                        color: const Color(0xFF272727), fontWeight: FontWeight.w700),
                  ),
                ),
                accountName: Text(
                  'Lucas Lumertz',
                  style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                accountEmail: Text(
                  'lucas@hotmail.com',
                  style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 15.0, bottom: 5.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(
                      Icons.settings_outlined,
                      color: Color(0xFFF80F78),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Configurações',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF272727),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return ListView(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Text(
                                      'Termos de privacidade:',
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Nossa prioridade é proteger seus dados. O TaskBox coleta informações pessoais mínimas e estritamente necessárias para funcionar adequadamente. Não compartilhamos seus dados com terceiros e os mantemos seguros por meio de criptografia. Garantimos total confidencialidade e transparência. Seu uso é anônimo, e não rastreamos seu comportamento. Sua confiança é nossa prioridade. Em caso de dúvidas, consulte nossa política completa de privacidade em nosso site. Agradecemos por confiar em nós para ajudar você a organizar suas tarefas de maneira segura e eficiente.',
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                    ),
                                  ),
                                  // Com a variável:
                                  CheckboxListTile(
                                    title: Text(
                                      'Aceitar todos os termos?',
                                      style: GoogleFonts.roboto(),
                                    ),
                                    value: isChecked,
                                    activeColor: const Color(0xFFF80F78),
                                    onChanged: (value) async {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                      await Future.delayed(
                                          const Duration(seconds: 2));
                                      if (context.mounted) Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                width: double.infinity,
                child: Row(
                  children: [
                    const Icon(
                      Icons.description_outlined,
                      color: Color(0xFFF80F78),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Política de privacidade',
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF272727),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 15.0, bottom: 5.0),
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext contenxt) {
                      return AlertDialog(
                        alignment: Alignment.center,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        title: Text(
                          'Atenção!',
                          style: GoogleFonts.roboto(),
                        ),
                        content: Wrap(
                          children: [
                            Text(
                              'Você quer mesmo sair do aplicativo?',
                              style: GoogleFonts.roboto(),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Não',
                              style: GoogleFonts.roboto(
                                color: const Color(0xFFF80F78),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: Text(
                              'Sim',
                              style: GoogleFonts.roboto(
                                color: const Color(0xFF272727),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(
                      Icons.exit_to_app_outlined,
                      color: Color(0xFFF80F78),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Sair',
                      style: TextStyle(
                        color: Color(0xFF272727),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
