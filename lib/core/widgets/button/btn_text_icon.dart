// import 'package:flutter/material.dart';
// import 'package:tecnol/core/constants/constants.dart';
// import 'package:tecnol/core/models/buttom_model.dart';
// import 'package:tecnol/core/models/status_model.dart';
// import 'package:tecnol/core/widgets/typography/subtitle_two.dart';

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

// class SwButtomIcon extends StatelessWidget {
//   final Function()? onPress;
//   final ButtonStatus status;
//   final IconData icon;
//   final IconData label;

//   const SwButtomIcon({
//     super.key,
//     required this.icon,
//     required this.label,
//     this.onPress,
//     this.status = ButtonStatus.normal, 
//   });

//   @override
//   Widget build(BuildContext context) => 
//     TextButton.icon(
//       style: TextButton.styleFrom(
//         shape: const StadiumBorder(),
//         padding: const EdgeInsets.symmetric(horizontal: 15)
//       ),
//       onPressed: () {},
//       label: const SubtitleTwo(
//         text: 'Editar',
//         color: Constants.mainColor,
//       ),
//       icon: Icon(icon),
//     );
// }
