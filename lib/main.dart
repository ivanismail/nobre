import 'package:get_storage/get_storage.dart';

import 'app/export.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: "Nobre",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: XTheme.themeData(),
      builder: (context, child) {
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: .9),
        );
      },
    ),
  );
}
