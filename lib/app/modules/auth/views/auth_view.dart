import 'package:nobre/app/modules/auth/controllers/auth_controller.dart';
import 'package:nobre/app/widgets/text_field.dart';

import '../../../export.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/ripple.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: XColor.primary(),
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacing(height: 22),
              Container(
                padding: pageWrapper(),
                margin: pageWrapper(),
                decoration: BoxDecoration(
                  borderRadius: XTheme.borderRadius(),
                  color: XColor.netral1(),
                ),
                child: Column(
                  children: [
                    Spacing(height: 22),
                    Text('Nobre', style: h7b),
                    Spacing(height: 22),
                    XTextField(
                      labelText: 'No Handphone',
                      hintText: '081234567xxx',
                      controller: controller.phoneNumber,
                    ),
                    XTextField(
                      labelText: 'Password',
                      hintText: 'Password anda',
                      controller: controller.pass,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Belum punya akun?',
                          style: TextStyle(
                            fontSize: h3,
                            color: XColor.netral6(),
                          ),
                        ),
                        Spacing(width: 8),
                        XRipple(
                          onTap: () => Get.toNamed(Routes.REGISTER),
                          child: Text(
                            'Daftar Sekarang',
                            style: TextStyle(
                              fontSize: h3,
                              color: XColor.primary(),
                            ),
                          ),
                        )
                      ],
                    ),
                    Spacing(height: 22),
                    Container(
                      width: Get.width,
                      child: SolidButton(
                        text: 'Masuk',
                        onTap: () => controller.doLogin(),
                      ),
                    ),
                    Spacing(height: 22),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
