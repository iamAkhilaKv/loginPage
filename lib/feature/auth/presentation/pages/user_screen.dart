import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/login_controller.dart';

class UserScreen extends HookConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return Scaffold(

      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/a.png",
        fit: BoxFit.cover,)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: height *0.80,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration:  BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(52),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("DashBoard",style: Theme.of(context).textTheme.headlineLarge,),
                  Text("Hi There",style: Theme.of(context).textTheme.titleMedium,),
                  Divider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 0.9,
                  ),
                  Gap(20),
                  SizedBox(
                    height: height*0.15,
                    width: width,
                    child: Card(
                      elevation: 8,
                      child: Center(child: Text(
                          "${loginState.auth?.firstName}${loginState.auth?.lastName}"
                      ,style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary
                      ),
                      )),
                    ),
                  ),
                  Gap(20),
                  SizedBox(

                    width: width,
                    child: Card(
                      color: Theme.of(context).cardColor,
                      elevation: 8,
                      child: Column(
                        children: [

                      Text("${loginState.auth?.username}"),

                          Image.network(
                            loginState.auth!.image,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                          ),
                          Text("${loginState.auth?.email}"),
                          Gap(10),
                          Text("Gender: ${loginState.auth?.gender}"),
                        ],
                      )
                    ),
                  )
                ],
              ),

            ),
          )
        ],
      )
    );
  }
}
