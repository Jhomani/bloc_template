import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:template/core/utils/app_setting_util.dart';
import 'package:template/core/utils/logger.dart';
import 'package:template/core/widgets/basic_scroll.dart';
import 'package:template/core/widgets/typography_widget.dart';
import 'package:template/features/auth/presentation/bloc/login_bloc.dart';
import 'package:template/features/auth/presentation/widget/login_container.dart';
import 'package:template/settings/palette_setting.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key}) {
    updateStatusBar(color: const Color(0x00000000));
  }

  @override
  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).padding.top;
    double height = MediaQuery.of(context).size.height
      - MediaQuery.of(context).viewInsets.bottom - top;

    height.log();

    return BlocProvider(
      create: (context) => GetIt.instance<LoginBloc>(),
      child: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.only(top: top),
          decoration: BoxDecoration(
            color: SwColors.primary,
            image: const DecorationImage(
              image: AssetImage('assets/illustrations/bg_auth_vector.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth
            ),
          ),
          child: BasicScroll(
            gap: 20,
            crossAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                child: Column(
                  children: [
                    SwTypography.headerFour('Register'),
                    SwTypography.caption('Create new accond'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                constraints: BoxConstraints(
                  maxWidth: 420,
                  minHeight: height - 80 - 20,
                ),
                decoration: BoxDecoration(
                  color: SwColors.secondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                ),
                child: const LoginContainer()
              ),
            ],
          )
        )
      ),
  );
  } 
}
