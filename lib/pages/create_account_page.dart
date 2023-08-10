import 'package:flutter/material.dart';
import 'package:to_do_list/pages/login_page.dart';
import 'package:to_do_list/shared/app_images.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  var nomeController = TextEditingController(text: '');
  var cpfController = TextEditingController(text: '');
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Image.asset(AppImages.logo3),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: nomeController,
                  onChanged: (value) {
                    value = nomeController.text;
                  },
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0.0),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3FAEdB))),
                    labelText: 'Informe o seu nome',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    hintText: "Fulano Alguma Coisa",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.person_2_outlined,
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
                  controller: cpfController,
                  onChanged: (value) {
                    value = cpfController.text;
                  },
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0.0),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3FAEdB))),
                    labelText: 'Informe o seu cpf',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    hintText: "XXX.XXX.XXX-XX",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.assignment_ind_outlined,
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
                  controller: emailController,
                  onChanged: (value) {
                    value = emailController.text;
                  },
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 0.0),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3FAEdB))),
                    labelText: 'Informe o seu e-mail',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    hintText: "exemplo@email.com",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
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
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 0.0),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF3FAEdB))),
                    labelText: 'Informe a sua senha',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    hintText: "********",
                    hintStyle: const TextStyle(
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
                height: 20,
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: 
                    SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      final String nome = nomeController.text.trim();
                      final String cpf = cpfController.text.trim();
                      final String email = emailController.text.trim();
                      final String senha = senhaController.text;

                      if (nome.length < 3) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Nome deve conter mais de 3 caracteres!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ));
                      } else if (cpf.length < 14) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'CPF inválido!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ));
                      } else if (!email.contains('@')) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'E-mail inválido!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ));
                      } else if (senha.length < 6) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Senha deve conter mais de 6 caracteres!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ));
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF3FAEdB)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
// ... restante do código ...
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  'ou',
                  style: TextStyle(color: Color(0xFFF2F2F2), fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Já possui uma conta? Faça o',
                    style: TextStyle(color: Color(0xFFF2F2F2), fontSize: 16),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size.zero, padding: EdgeInsets.zero),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/loginPage');
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Login!',
                          style:
                              TextStyle(color: Color(0xFF272727), fontSize: 18),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
