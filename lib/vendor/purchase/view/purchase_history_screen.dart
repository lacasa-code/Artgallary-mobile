import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:flutter/material.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  const PurchaseHistoryScreen({
    Key key,
  }) : super(key: key);

  @override
  _PurchaseHistoryScreenState createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  var scrollController = ScrollController(initialScrollOffset: 1.0);
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Purchase History',
        ),
      ),
      backgroundColor: MyTheme.kMainBackgroundColor,
      body: Card(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        elevation: 8,
        child: SingleChildScrollView(
          child: Scrollbar(
            controller: scrollController,
            isAlwaysShown: true,
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DataTable(
                    columnSpacing: 40,
                    columns: [
                      DataColumn(
                        label: Text('Code'),
                      ),
                      DataColumn(
                        label: Text('Date'),
                      ),
                      DataColumn(
                        label: Text('Amount'),
                      ),
                      DataColumn(
                        label: Text('Delivery Status'),
                      ),
                      DataColumn(
                        label: Text('Payment Status'),
                      ),
                      DataColumn(
                        label: Text('Options'),
                      ),
                    ],
                    rows: List.generate(
                      10,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                            Text(
                              '20220420-12025799',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              '2022-04-20',
                              style: TextStyle(),
                            ),
                          ),
                          DataCell(
                            Text(
                              'SR28.00',
                              style: TextStyle(),
                            ),
                          ),
                          DataCell(
                            Text(
                              'Pending',
                              style: TextStyle(),
                            ),
                          ),
                          DataCell(
                            Chip(
                              backgroundColor: Colors.red,
                              label: Text(
                                'Un-paid',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                OptionItem(
                                  backgroundColor: Color(0xffFCE5E9),
                                  iconColor: Colors.red,
                                  icons: Icons.delete_outline,
                                  onTap: () {},
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                OptionItem(
                                  backgroundColor: Color(0xffE3F6FD),
                                  iconColor: Color(0xff59C8F4),
                                  icons: Icons.visibility,
                                  onTap: () {},
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                OptionItem(
                                  backgroundColor: Color(0xffFEF7E2),
                                  iconColor: Color(0xffF7C61F),
                                  icons: Icons.download,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  const OptionItem({
    Key key,
    @required this.icons,
    @required this.backgroundColor,
    @required this.iconColor,
    @required this.onTap,
  }) : super(key: key);
  final IconData icons;
  final Color backgroundColor;
  final Color iconColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        child: Icon(
          icons,
          color: iconColor,
        ),
      ),
    );
  }
}
