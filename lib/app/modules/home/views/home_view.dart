import '../../../export.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Spacing(),
          Padding(
            padding: pageWrapper(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('nobre', style: h7n),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: XTheme.borderRadius(),
                    color: XColor.netral2(),
                  ),
                  child: SvgPicture.asset(
                    'assets/notification.svg',
                    color: XColor.netral6(),
                  ),
                )
              ],
            ),
          ),
          Spacing(),
          Container(
            width: Get.width,
            child: Image.asset('assets/banner.png'),
          )
        ],
      )),
    );
  }
}
