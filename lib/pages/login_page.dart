import 'package:flutter/material.dart';
import 'package:to_do_list/pages/create_account_page.dart';
import 'package:to_do_list/pages/home_page.dart';
import 'package:to_do_list/shared/app_images.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: '');
  var senhaController = TextEditingController(text: '');
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF80F78),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              Image.asset(
                AppImages.logo3,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Text(
                  'Ja tem cadastro?',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Text(
                  'Faça seu login e make it happen_',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: emailController,
                  onChanged: (value) {
                    value = emailController.text;
                  },
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 0.0),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3FAEdB))),
                    labelText: 'Informe o seu e-mail',
                    labelStyle: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    hintText: "exemplo@email.com",
                    hintStyle: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                  ),
                  cursorColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: senhaController,
                  obscureText: isObscureText,
                  onChanged: (value) {
                    value = senhaController.text;
                  },
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 0.0),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3FAEdB))),
                    labelText: 'Informe a sua senha',
                    labelStyle: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    hintText: "********",
                    hintStyle: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  cursorColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      if (emailController.text.trim() ==
                              'lucas@hotmail.com' &&
                          senhaController.text.trim() == '123456') {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text(
                            'Erro ao efetuar o login',
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ));
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFF3FAEdB)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      'ENTRAR',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(40, 90, 40, 10),
                child: Text(
                  'Esqueci minha senha',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateAccountPage()));
                },
                child: Text(
                  'Criar conta',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
