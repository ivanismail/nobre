import 'package:nobre/app/widgets/buttons.dart';

import '../../../export.dart';
import '../../../widgets/text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: XColor.netral8()),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Daftar Akun",
          style: h5b.copyWith(color: XColor.netral8()),
        ),
      ),
      body: Padding(
        padding: pageWrapper(),
        child: Column(
          children: [
            Spacing(),
            XTextField(
              labelText: 'Nama Lengkap',
              hintText: 'Nama anda',
            ),
            XTextField(
              labelText: 'No Handphone',
              hintText: '081234567xxx',
            ),
            XTextField(
              labelText: 'Password',
              hintText: 'Password',
            ),
            XTextField(
              labelText: 'Konfirmasi Password',
              hintText: 'Konfirmasi Password',
            ),
            SizedBox(
              width: Get.width,
              child: SolidButton(text: 'Daftar'),
            )
          ],
        ),
      ),
    );
  }
}
