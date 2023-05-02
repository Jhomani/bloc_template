// import 'package:flutter/material.dart';
// import 'package:tecnol/core/models/buttom_model.dart';
// import 'package:tecnol/core/models/status_model.dart';

// Map<ButtonStatus, ColorByStatus> colorStatusDic = {
//   ButtonStatus.danger: ColorByStatus(
//     const Color(0xFFEAEEF0),
//     const Color(0xFFFE3E55),
//   ),
//   ButtonStatus.normal: ColorByStatus(
//     const Color(0xFFEAEEF0),
//     const Color(0xFF243656),
//   ),
// };

// class SecondaryBtn extends StatelessWidget {
//   final Function()? onPressed;
//   final String? text;
//   final IconData? icon;
//   final double? width;
//   final double? height;
//   final bool danger;
//   final bool rounded;
//   final ButtonStatus status;

//   const SecondaryBtn({
//     Key? key,
//     this.text,
//     this.onPressed,
//     this.icon,
//     this.width,
//     this.height,
//     this.danger = false,
//     this.rounded = false,
//     this.status = ButtonStatus.normal, 
//   }): super(key : key);

//   @override
//   Widget build(BuildContext context) => SizedBox(
//     width: width,
//     height: height,
//     child: ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: colorStatusDic[status]!.background,
//         foregroundColor: colorStatusDic[status]!.foreground,
//         shape: rounded ? const StadiumBorder() : null,
//         elevation: 0,
//         textStyle: const TextStyle(
//           fontWeight: FontWeight.w600,
//         )
//       ),
//       child: _getButtonBody(),
//     ) 
//   );

//   Widget? _getButtonBody() {
//     Widget? resp;

//     if(icon != null) resp = Icon(icon!);
//     if(text != null) {
//       resp = Text(
//         text!,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold
//         ),
//       );
//     }

//     return resp;
//   }
// }