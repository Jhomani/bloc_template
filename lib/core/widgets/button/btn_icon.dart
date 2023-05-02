// import 'package:flutter/material.dart';
// import 'package:tecnol/core/constants/constants.dart';
// import 'package:tecnol/core/models/buttom_model.dart';
// import 'package:tecnol/core/models/status_model.dart';

// Map<ButtonStatus, ColorByStatus> colorStatusDic = {
//   ButtonStatus.danger: ColorByStatus(
//     const Color(0xFFFE3E55),
//     Colors.white,
//   ),
//   ButtonStatus.normal: ColorByStatus(
//     Constants.mainColor,
//     Colors.white,
//   ),
// };

// class SwButtonIcon extends StatelessWidget {
//   final Function()? onPress;
//   final ButtonStatus status;
//   final IconData icon;

//   const SwButtonIcon({
//     super.key,
//     required this.icon,
//     this.onPress,
//     this.status = ButtonStatus.normal, 
//   });

//   @override
//   Widget build(BuildContext context) => ClipOval(
//     child: SizedBox.fromSize(
//       size: const Size(34, 34),
//       child: InkWell(
//           splashColor: Colors.white24,
//           onTap: onPress,
//           child: Icon(
//             icon,
//             color: colorStatusDic[status]!.background,
//           )
//       ),
//     ),
//   );
// }
