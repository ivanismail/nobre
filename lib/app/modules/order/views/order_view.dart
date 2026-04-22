import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../../export.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/ripple.dart';
import '../controllers/order_controller.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  final OrderController controller = OrderController();

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
          "Order",
          style: h5b.copyWith(color: XColor.netral8()),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<OrderController>(
          init: OrderController(),
          initState: (_) {},
          builder: (_) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    height: Get.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: pageWrapper(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: XColor.primaryLight(),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/beard.svg',
                                      height: 32,
                                    ),
                                  ),
                                  Spacing(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Potong Rambut', style: h5n),
                                      // Text('Rp. 18.000,-'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Spacing(height: 20),
                        Padding(
                          padding: pageWrapper(),
                          child: Text('Date', style: h3b),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: WeeklyDatePicker(
                            selectedDay: controller.selectedDay,
                            changeDay: (value) => setState(() {
                              controller.selectedDay = value;
                            }),
                            enableWeeknumberText: false,
                            // selectedBackgroundColor: XColor.primary(),
                            weeknumberColor: XColor.netral8(),
                            weeknumberTextColor: Colors.white,
                            backgroundColor: XColor.netral1(),
                            weekdayTextColor: XColor.netral8(),
                            digitsColor: XColor.netral8(),
                            // selectedDigitBackgroundColor: const Color(0xFF57AF87),
                            weekdays: const [
                              "Mo",
                              "Tu",
                              "We",
                              "Th",
                              "Fr",
                              "St",
                              "Su"
                            ],
                            daysInWeek: 7,
                          ),
                        ),
                        Spacing(height: 20),
                        Padding(
                          padding: pageWrapper(),
                          child: Text('Time', style: h3b),
                        ),
                        Spacing(),
                        Obx(() => Padding(
                              padding: pageWrapper(),
                              child: Wrap(
                                spacing: 12,
                                runSpacing: 12,
                                children: controller.times.map((time) {
                                  final isSelected =
                                      controller.selectedTime.value == time;

                                  return GestureDetector(
                                    onTap: () => controller.selectTime(time),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.blue
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(30),
                                        border:
                                            Border.all(color: XColor.primary()),
                                      ),
                                      child: Text(
                                        time,
                                        style: TextStyle(
                                          color: isSelected
                                              ? XColor.netral1()
                                              : XColor.primary(),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                        Spacing(height: 20),
                        ChoseCard(
                          title: 'Shaver',
                          icon: '',
                          content: 'Pilih Shaver',
                        ),
                        Spacing(height: 20),
                        ChoseCard(
                          title: 'Payment',
                          icon: '',
                          content: 'Pilih Metode Pembayaran',
                        ),
                        // XDivider(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: pageWrapper().copyWith(bottom: 12, top: 12),
                    width: Get.width,
                    decoration: BoxDecoration(
                      boxShadow: XTheme.botShadow(),
                      border: Border.all(color: XColor.netral3()),
                      color: XColor.netral1(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<OrderController>(
                          init: OrderController(),
                          initState: (_) {},
                          builder: (_) {
                            return Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Total', style: h3n),
                                  Text('RP. 38.000,-',
                                      // rupiah(int.parse(this
                                      //         .controller
                                      //         .nominalCon
                                      //         .text
                                      //         .replaceAll(',', '')
                                      //         .replaceAll('.', '')
                                      //         .replaceAll('-', '')) +
                                      //     this.controller.adminFee.toInt() -
                                      //     this.controller.discount.toInt()),
                                      style: h4b),
                                ],
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: GetBuilder<OrderController>(
                            init: OrderController(),
                            initState: (_) {},
                            builder: (_) {
                              return SolidButton(
                                text: 'Confirm',
                                // onTap:
                                //     this.controller.selectedPaymentMethod == null
                                //         ? () {}
                                //         : this.controller.doCheckout,
                                // inactive:
                                //     this.controller.selectedPaymentMethod == null
                                //         ? true
                                //         : false,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ChoseCard extends StatelessWidget {
  final String? title, icon, content;
  final Function()? onTap;
  const ChoseCard({Key? key, this.title, this.icon, this.content, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pageWrapper(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.title ?? '', style: h3b),
          Spacing(),
          XRipple(
            onTap: this.onTap ?? () {},
            child: Container(
              width: Get.width,
              padding: paddingAll().copyWith(top: 12, bottom: 12),
              decoration: BoxDecoration(
                borderRadius: XTheme.borderRadius(),
                border: Border.all(color: XColor.netral4()),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/$icon.svg',
                        height: 24,
                        color: XColor.netral5(),
                      ),
                      Spacing(width: 12),
                      Container(
                        width: Get.width / 1.6,
                        child: Text(
                          this.content ?? '',
                          style: h4n,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: XColor.netral5(),
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          Spacing()
        ],
      ),
    );
  }
}
