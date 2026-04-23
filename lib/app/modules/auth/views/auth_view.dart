import 'package:nobre/app/widgets/text_field.dart';

import '../../../export.dart';
import '../../../widgets/buttons.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
                      XTextField(labelText: 'No Handphone'),
                      XTextField(labelText: 'Password'),
                      Spacing(height: 20),
                      Container(
                        width: Get.width,
                        child: SolidButton(
                          text: 'Masuk',
                          onTap: () {},
                        ),
                      ),
                      Spacing(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
