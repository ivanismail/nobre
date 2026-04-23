import 'app/export.dart';
import 'app/routes/app_pages.dart';

void main() {
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
