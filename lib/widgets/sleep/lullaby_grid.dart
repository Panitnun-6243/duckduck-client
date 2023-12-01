// import 'package:duckduck/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../models/lullaby_item.dart';

// class LullabyGrid extends StatefulWidget {
//   const LullabyGrid({super.key});

//   @override
//   State<LullabyGrid> createState() => _LullabyGridState();
// }

// class _LullabyGridState extends State<LullabyGrid> {
//   @override
//   Widget build(BuildContext context) {
//     final List<LullabyItem> items = [
//       LullabyItem(
//         title: 'Custom',
//         subtitle: '7 Songs • Custom',
//         imageUrl: 'https://via.placeholder.com/150',
//         onClick: () {
//           print('Instrument 1 clicked');
//         },
//       ),

//       LullabyItem(
//         title: 'Instrument',
//         subtitle: '7 Songs • Instrument',
//         imageUrl: 'https://via.placeholder.com/150',
//         onClick: () {
//           print('Instrument 1 clicked');
//         },
//       ),
//       LullabyItem(
//         title: 'Noise',
//         subtitle: '7 Songs • Noise',
//         imageUrl: 'https://via.placeholder.com/150',
//         onClick: () {
//           print('Instrument 1 clicked');
//         },
//       ),
//       LullabyItem(
//         title: 'Natural',
//         subtitle: '7 Songs • Natural',
//         imageUrl: 'https://via.placeholder.com/150',
//         onClick: () {
//           print('Instrument 1 clicked');
//         },
//       ),
//       // ... Add more items
//     ];
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 50,
//       ),
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         final item = items[index];
//         return GestureDetector(
//           onTap: item.onClick,
//           child: Column(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: Image.network(
//                   item.imageUrl,
//                   width: 120,
//                   height: 120,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 8),
//                   Text(item.title,
//                       style: GoogleFonts.rubik(
//                         fontSize: 17,
//                         fontWeight: FontWeight.w500,
//                         color: DuckDuckColors.skyBlue,
//                       )),
//                   const SizedBox(height: 4),
//                   Text(
//                     item.subtitle,
//                     style: GoogleFonts.rubik(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w400,
//                       color: DuckDuckColors.skyBlue.withOpacity(0.6),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
