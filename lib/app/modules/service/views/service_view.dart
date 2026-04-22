import '../../../export.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({super.key});

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
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
          "Hair Cut",
          style: h5b.copyWith(color: XColor.netral8()),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: XColor.netral8()),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
