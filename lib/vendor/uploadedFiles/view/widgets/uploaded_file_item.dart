import 'package:active_ecommerce_flutter/vendor/utils/components/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './popup_menu_title.dart';

class UploadedFileItem extends StatelessWidget {
  const UploadedFileItem({
    Key key,
    @required this.uploadedFilePath,
  }) : super(key: key);
  final String uploadedFilePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 5,
          child: SizedBox(
            // height: ScreenUtil().setHeight(200),
            // width: ScreenUtil().setWidth(200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    // borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      uploadedFilePath ?? 'assets/art1.jpeg',
                      height: ScreenUtil().setHeight(155),
                      width: ScreenUtil().setWidth(155),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      uploadedFilePath?.split('/')?.last ??
                          'image.jpeg', //'image.png',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '27.43kb',
                      style: TextStyle(
                        color: Color(0xff8896A9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: Card(
            color: Colors.white,
            child: PopupMenuButton<String>(
              onSelected: (v) {
                if (v == 'details') {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: SingleChildScrollView(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            DetailsInfoItem(
                              details: uploadedFilePath?.split('/')?.last ??
                                  'image.jpeg',
                              title: 'File Name:',
                            ),
                            DetailsInfoItem(
                              details: 'image',
                              title: 'File Type:',
                            ),
                            DetailsInfoItem(
                              details: '27.43kb',
                              title: 'File Size:',
                            ),
                            DetailsInfoItem(
                              details:
                                  '${DateTime.now().subtract(Duration(days: 1)).toString().substring(0, 16)}',
                              title: 'Uploadet At:',
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Transform.scale(
                              scale: 0.7,
                              child: RegisterButton(
                                onPressed: () {},
                                title: 'Download',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                  value: 'details',
                  child: PopupMenuTitle(
                    icons: Icons.info_outline,
                    title: 'Details Info',
                  ),
                ),
                PopupMenuItem(
                  value: 'download',
                  child: PopupMenuTitle(
                    icons: Icons.download,
                    title: 'Download',
                  ),
                ),
                PopupMenuItem(
                  value: 'copy',
                  child: PopupMenuTitle(
                    icons: Icons.copy_outlined,
                    title: 'Copy Link',
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: PopupMenuTitle(
                    icons: Icons.delete_outline,
                    title: 'Delete',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DetailsInfoItem extends StatelessWidget {
  const DetailsInfoItem({
    Key key,
    @required this.details,
    @required this.title,
  }) : super(key: key);

  final String details;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          details,
          style: TextStyle(
            color: Color(0xff8B8E93),
            fontSize: 15,
          ),
        ),
      ],
    );
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: details,
            style: TextStyle(
              color: Color(0xff8B8E93),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
