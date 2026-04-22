import 'package:nobre/app/modules/service/controllers/service_controller.dart';

import '../../../export.dart';
import '../../../widgets/ripple.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({super.key});

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  final ServiceController controller = Get.find<ServiceController>();
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
      body: SafeArea(
        child: Padding(
          padding: pageWrapper(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* BANNER
              Container(
                width: Get.width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [XColor.primary(), Colors.blueAccent],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What kind of hair suits you?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Start now to find out what kind of hair suits you",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      child: Text("Start"),
                    )
                  ],
                ),
              ),
              Spacing(height: 20),
              Text("Our", style: h4n),
              Text("Services", style: h5b),
              Spacing(height: 20),

              /// CATEGORY
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: controller.categories.map((cat) {
                      final isSelected =
                          controller.selectedCategory.value == cat;

                      return GestureDetector(
                        onTap: () => controller.changeCategory(cat),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? XColor.primary()
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: XColor.primary()),
                          ),
                          child: Text(
                            cat,
                            style: TextStyle(
                              color: isSelected
                                  ? XColor.netral1()
                                  : XColor.primary(),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )),

              Spacing(height: 20),

              /// LIST SERVICE
              Expanded(
                child: SingleChildScrollView(
                  child: ListService(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListService extends StatelessWidget {
  // final TransactionController controller;
  // final List<DataTransaction> listService;
  const ListService({
    Key? key,
    // required this.controller,
    // required this.listService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // itemCount: listService.length,
      itemCount: 10,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      primary: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        // DataService current = listService[index];
        return ServiceCard();
      },
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        XRipple(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: XColor.primaryLight(),
                      ),
                      child: SvgPicture.asset(
                        'assets/beard.svg',
                        height: 32,
                      ),
                    ),
                    Spacing(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Potong Rambut'),
                        Text('Estimasi 30 menit'),
                        Text('Rp. 18.000,-'),
                      ],
                    ),
                  ],
                ),
                SvgPicture.asset('assets/arrow-right.svg', width: 24)
              ],
            ),
          ),
        ),
        Spacing()
      ],
    );
  }
}
