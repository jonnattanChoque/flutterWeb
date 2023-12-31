import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_background.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {

  final Widget child;
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final yourScrollController = ScrollController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Scrollbar(
        controller: yourScrollController,
        thumbVisibility: true,
        
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            (size.width > 1000) ? _DesktopBody(child: child) : _MobileBody(child: child),
          ],
        ),
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;
  
  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: Colors.black,
      child: Row(
        children: [
          const Expanded(child: BackgroundAuth()),

          Container(
            width: 600,
            height: double.infinity,
            color: const Color.fromARGB(255, 98, 96, 96),
            child: Column(
              children: [
                const CustomTitle(),
                const SizedBox(height: 30),
                Expanded(child: child)
              ],
            )
            ,
          )
        ],
      ),
    );
  }
}


class _MobileBody extends StatelessWidget {
  final Widget child;
  
  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 425,
            child: child,
          ),
          const SizedBox(
            width: double.infinity,
            height: 400,
            child: BackgroundAuth(),
          )
        ],
      ),
    );
  }
}