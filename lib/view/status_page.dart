import 'package:appflut/view/auth_page.dart';
import 'package:appflut/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/auth_provider.dart';




class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer
      (
        builder : (context, ref, child) {
          final authData = ref.watch(authStream);
          return authData.when(
              data: (data) {
                if(data == null)
                  {
                    return AuthPage();
                  }else
                    {
                      return HomePage();
                    }
              },
              error: (err, stack)=> Center(child: Text('err')),
              loading: ()=> Center(child: CircularProgressIndicator(
                color: Colors.yellow,
              )));

        }
        )
    );
  }
}
