import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'AppConstants.dart';
import 'WodlDimens.dart';


class CsCommonTextFieldWidget extends StatefulWidget {
  const CsCommonTextFieldWidget(
      {this.titleText = '',
      this.titleTextAlign = TextAlign.center,
      required this.isPassword,
      required this.hintText,
      required this.textController,
      required this.errorText,
      required this.errorValidate});

  final String titleText;
  final TextAlign titleTextAlign;
  final bool isPassword;
  final String hintText;
  final String errorText;
  final TextEditingController textController;
  final bool errorValidate;

  @override
  _CsCommonTextFieldWidgetState createState() =>
      _CsCommonTextFieldWidgetState();
}

class _CsCommonTextFieldWidgetState extends State<CsCommonTextFieldWidget> {
  var isVisible = false;

  @override
  void initState() {
    super.initState();
    isVisible = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: widget.textController,
      obscureText: isVisible,
      decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorText: widget.errorValidate ? null : widget.errorText,
          contentPadding: const EdgeInsets.all(10.0),
          labelText: widget.hintText,
          labelStyle: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: PLACE_HOLDER_COLOR,
              fontSize: SPACE14),
          // pass the hint text parameter here
          hintStyle: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: PLACE_HOLDER_COLOR,
              fontSize: SPACE14),
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: _togglePasswordView,

                  /// This is Magical Function
                  child: Icon(
                    isVisible
                        ?

                        /// CHeck Show & Hide.
                        Icons.visibility
                        : Icons.visibility_off,
                  ),
                )
              : null),
      style: Theme.of(context)
          .textTheme
          .headline5!
          .copyWith(color: BLACK,
          fontSize: SPACE16),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isVisible = !isVisible;
    });
  }
}

class CsCommonButtonWidget extends StatefulWidget {
  const CsCommonButtonWidget(
      {required this.onPressed,
      required this.titleText,
      this.titleTextAlign = TextAlign.center});

  final Function? onPressed;
  final String titleText;
  final TextAlign titleTextAlign;

  @override
  _CsCommonButtonWidgetState createState() => _CsCommonButtonWidgetState();
}

class _CsCommonButtonWidgetState extends State<CsCommonButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(SPACE26)),
        gradient: LinearGradient(
          colors: <Color>[
            APP_PRIMARY_DARK_COLOR,
            APP_PRIMARY_COLOR,
          ],
        ),
      ),
      padding:  EdgeInsets.all(SPACE2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent, shadowColor: Colors.transparent),
        child: Text(
          widget.titleText,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: WHITE,
              fontSize: SPACE20),
        ),
        onPressed: () {
          widget.onPressed!();
        },
      ),
    );
  }
}

class CommonWidget {
  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7), child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showAlertDialog(BuildContext context, String message, String title) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(AppConstants.OK),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension DoubleValidator on String {
  bool isDouble() {
    if (double.tryParse(this) == null){
      if (double.parse(this).isFinite) return true;
    }
    return false;
  }
}