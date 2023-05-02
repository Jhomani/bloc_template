import 'package:flutter/material.dart';
import 'package:template/core/utils/logger.dart';
import 'package:template/core/widgets/basic_scroll.dart';
import 'package:template/core/widgets/typography_widget.dart';
import 'package:template/core/pallette.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).padding.top;
    double height = MediaQuery.of(context).size.height
      - MediaQuery.of(context).viewInsets.bottom - top;

    height.log();

    return Scaffold(
      backgroundColor: Pallette.primary,
      body: Container(
        padding: EdgeInsets.only(top: top),
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/illustrations/bg_auth_vector.png'),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth
          )
        ),
        child: BasicScroll(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwTypography.headerFour(
                      'Register',
                      color: Colors.white
                    ),
                    SwTypography.bodyTwo(
                      'Create new accond',
                      color: Colors.white
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              constraints: BoxConstraints(
                maxWidth: 420,
                minHeight: height - 100,
              ),
              decoration: BoxDecoration(
                color: Pallette.light,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
              child: child
            ),
          ],
        )
      )
    );
  }
}
