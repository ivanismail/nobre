import 'package:nobre/app/routes/app_pages.dart';

import '../../../export.dart';
import '../../../widgets/cache_image.dart';
import '../../../widgets/ripple.dart';

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
          Spacing(height: 30),
          Container(
            padding: pageWrapper(),
            width: Get.width,
            child: Image.asset('assets/banner.png'),
          ),
          Spacing(height: 30),
          Padding(
            padding: pageWrapper(),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: XTheme.borderRadius(radius: 8),
                color: XColor.netral2(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Our \nService', style: h3n),
                      XRipple(
                        onTap: () => Get.toNamed(Routes.SERVICE),
                        child: Text(
                          'See All',
                          style: h3n.copyWith(color: XColor.primary()),
                        ),
                      ),
                    ],
                  ),
                  Spacing(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MenuItem(
                        tipe: 'menu',
                        title: 'Cut',
                        icon: 'cut',
                      ),
                      MenuItem(
                        tipe: 'menu',
                        title: 'Beard',
                        icon: 'beard',
                      ),
                      MenuItem(
                        tipe: 'menu',
                        title: 'Color',
                        icon: 'color',
                      ),
                    ],
                  ),
                  Spacing()
                ],
              ),
            ),
          ),
          Spacing(height: 30),
          Padding(
            padding: pageWrapper(),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: XTheme.borderRadius(radius: 8),
                color: XColor.netral2(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Our \nShavers', style: h3n),
                      Text(
                        'See All',
                        style: h3n.copyWith(color: XColor.primary()),
                      ),
                    ],
                  ),
                  Spacing(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MenuItem(
                        title: 'John',
                        icon: 'https://thispersondoesnotexist.com',
                      ),
                      MenuItem(
                        title: 'Mark',
                        icon: 'https://thispersondoesnotexist.com',
                      ),
                      MenuItem(
                        title: 'Jason',
                        icon: 'https://thispersondoesnotexist.com/',
                      ),
                    ],
                  ),
                  Spacing()
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String? title, icon, tipe;
  final double? size;
  final Function()? onTap;
  final Color? color;

  const MenuItem({
    Key? key,
    this.title,
    this.icon,
    this.tipe,
    this.onTap,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          XRipple(
            borderRadius: BorderRadius.circular(12),
            onTap: this.onTap ?? () {},
            child: Container(
              padding: EdgeInsets.all(tipe == 'menu' ? 8 : 0),
              width: this.size ?? 48,
              height: this.size ?? 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: XColor.primaryLight(),
              ),
              child: tipe == 'menu'
                  ? SvgPicture.asset(
                      'assets/$icon.svg',
                      color: this.color ?? XColor.secondary(),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: XCachedImage(
                        fit: BoxFit.fitWidth,
                        url: icon,
                        errorImage: title,
                      ),
                    ),
            ),
          ),
          Spacing(height: 8),
          Text(this.title ?? '',
              textAlign: TextAlign.center,
              style: h3b.copyWith(
                color: this.color ?? XColor.netral7(),
              ))
        ],
      ),
    );
  }
}
