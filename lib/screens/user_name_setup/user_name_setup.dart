import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/db/db_service.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_flutter_toast.dart';
import 'package:myapp/widgets/our_shimmer_text.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:myapp/widgets/our_text_field.dart';

class UserNameSetup extends StatefulWidget {
  const UserNameSetup({Key? key}) : super(key: key);

  @override
  _UserNameSetupState createState() => _UserNameSetupState();
}

class _UserNameSetupState extends State<UserNameSetup> {
  TextEditingController _user_name_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(20),
              vertical: ScreenUtil().setSp(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const OurShimmerText(
                  title: "Setup your profile",
                ),
                const OurSizedBox(),
                const OurSizedBox(),
                const OurSizedBox(),
                Center(
                  child: Lottie.asset(
                    'assets/animations/profile.json',
                    height: ScreenUtil().setSp(200),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipPath(
        clipper: OvalTopBorderClipper(),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(20),
            vertical: ScreenUtil().setSp(10),
          ),
          height: ScreenUtil().setSp(300),
          color: Colors.black26,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: _user_name_controller,
                validator: (value) {},
                title: "Enter username",
                type: TextInputType.name,
                number: 1,
              ),
              OurSizedBox(),
              OurElevatedButton(
                title: "Sumit",
                function: () {
                  if (_user_name_controller.text.trim().isNotEmpty) {
                    print("object");
                    dbHelper().setUserName(_user_name_controller.text.trim());
                  } else {
                    OurToast().showErrorToast("Field can't be empty");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
