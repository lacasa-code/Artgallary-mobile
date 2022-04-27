import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:flutter/material.dart';
import './widgets/uploaded_file_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadedFilesScreen extends StatefulWidget {
  const UploadedFilesScreen({
    Key key,
  }) : super(key: key);

  @override
  _UploadedFilesScreenState createState() => _UploadedFilesScreenState();
}

class _UploadedFilesScreenState extends State<UploadedFilesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.kMainBackgroundColor,
      appBar: AppBar(
        title: Text('Uploaded Files'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        child: SingleChildScrollView(
          child: Wrap(
            // direction: Axis.vertical,
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              UploadedFileItem(
                uploadedFilePath: 'assets/art1.jpeg',
              ),
              UploadedFileItem(
                uploadedFilePath: 'assets/art2.jpeg',
              ),
              UploadedFileItem(
                uploadedFilePath: 'assets/art3.jpeg',
              ),
              UploadedFileItem(
                uploadedFilePath: 'assets/art4.jpeg',
              ),

              /*
              SizedBox(
                height: ScreenUtil().setHeight(200),
                width: ScreenUtil().setWidth(200),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: GridTile(
                    footer: Container(
                      height: ScreenUtil().setHeight(20),
                      // widt,
                      color: Colors.white,
                      child: Text('sss'),
                    ),
                    child: Card(
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),

                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/art1.jpeg',
                            height: ScreenUtil().setHeight(150),
                            width: ScreenUtil().setWidth(150),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}
