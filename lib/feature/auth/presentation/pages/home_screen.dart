import 'package:experimentlogin/feature/auth/presentation/pages/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/app_teme/app_colors.dart';
import '../../application/login_controller.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override

  Widget build(BuildContext context,WidgetRef ref) {

    final size = MediaQuery.of(context).size;
    final username=useTextEditingController(text: 'emilys');
    final pwd=useTextEditingController(text: 'emilyspass');

    final usernameError = useState<String?>(null);
    final passwordError = useState<String?>(null);
    final loginState = ref.watch(loginProvider);

    // 👂 Listen for SUCCESS changes
    ref.listen(loginProvider, (previous, next) {
      if (next.isSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const UserScreen()),
        );
      }

      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!)),
        );
      }
    });

    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              "assets/images/a.png",
              fit: BoxFit.cover,
            ),
          ),

          // White Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: size.height * 0.68,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration:  BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(52),
                ),
              ),
              child: Center(
                child: Column(
                 // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text("Welcome ",style: Theme.of(context).textTheme.headlineLarge,)),
                    Gap(70),
                    // Email
                    TextField(
                      controller: username,
                      decoration: InputDecoration(
                        hintText: "Email",
                          errorText: usernameError.value,
                          focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                          color: usernameError.value != null ? Colors.red : AppColors.accentViolet,
                          width: 2,
                          ),
                          ),

                      ),

                    ),

                    Gap(20),

                    // Password
                    TextField(
                      controller: pwd,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                          errorText: passwordError.value,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: passwordError.value != null ? Colors.red : AppColors.accentViolet,
                            width: 2,
                          ),
                        ),

                      ),
                    ),

                    const SizedBox(height: 58),

                    // Button
                    SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          if(username.text.isNotEmpty && pwd.text.isNotEmpty){

                                ref.read(loginProvider.notifier).login(username.text, pwd.text);
                          }
                          else{


                            if(username.text.isEmpty){
                              usernameError.value="Enter email";
                            }else{
                              usernameError.value="";
                            }
                            if(pwd.text.isEmpty)
                            {
                              passwordError.value="Enter password";

                            }else{
                              passwordError.value="";
                            }
                          }

                        },

                        child:  Text(
                          "Click Here",

                        ),
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