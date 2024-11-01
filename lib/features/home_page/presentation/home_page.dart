// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//       return SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildWalletBalance(),
//               SizedBox(height: 20),
//               _buildCarousel(),
//               SizedBox(height: 20),
//               _buildSectionTitle('Urgent Fundraising'),
//               _buildCategories(),
//               _buildFundraisingCards(),
//               SizedBox(height: 20),
//               _buildSectionTitle('Coming to an end'),
//               _buildEndFundraisingCards(),
//               SizedBox(height: 20),
//               _buildSectionTitle('Watch the Impact of Your Donation'),
//               _buildImpactCards(),
//               SizedBox(height: 20),
//               _buildSectionTitle('Prayers from Good People'),
//               _buildPrayers(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildWalletBalance() {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('\$349', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//           ElevatedButton(onPressed: () {}, child: Text('Top up'))
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCarousel() {
//     return Container(
//       height: 150,
//       color: Colors.grey[800],
//       child: Center(child: Text('Carousel Placeholder')),
//     );
//   }
//
//   Widget _buildSectionTitle(String title) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         TextButton(onPressed: () {}, child: Text('See all')),
//       ],
//     );
//   }
//
//   Widget _buildCategories() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         _buildCategoryButton('All'),
//         _buildCategoryButton('Medical'),
//         _buildCategoryButton('Disaster'),
//         _buildCategoryButton('Education'),
//       ],
//     );
//   }
//
//   Widget _buildCategoryButton(String title) {
//     return ElevatedButton(
//       onPressed: () {},
//       style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//       child: Text(title),
//     );
//   }
//
//   Widget _buildFundraisingCards() {
//     return SizedBox(
//       height: 120,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           _buildFundraisingCard('Help Orphanage Children', '\$2,379 raised from \$4,200', 18),
//           _buildFundraisingCard('Assist with Surgery', '\$3,287 raised from \$5,000', 11),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFundraisingCard(String title, String amount, int daysLeft) {
//     return Container(
//       width: 200,
//       margin: EdgeInsets.only(right: 12),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.grey[850],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           Spacer(),
//           Text(amount, style: TextStyle(color: Colors.green)),
//           Text('$daysLeft days left', style: TextStyle(color: Colors.grey)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildEndFundraisingCards() {
//     return SizedBox(
//       height: 120,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           _buildFundraisingCard('Helping Earthquake Victims', '\$4,259 raised from \$8,000', 4),
//           _buildFundraisingCard('Assist with Surgery', '\$3,462 raised from \$5,000', 3),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildImpactCards() {
//     return SizedBox(
//       height: 120,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           _buildImpactCard('Sarah\'s Surgery Was Successful'),
//           _buildImpactCard('Siamese Twins Surgery Was Successful'),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildImpactCard(String title) {
//     return Container(
//       width: 200,
//       margin: EdgeInsets.only(right: 12),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.grey[850],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(Icons.play_circle_filled, color: Colors.green, size: 24),
//           Spacer(),
//           Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPrayers() {
//     return Column(
//       children: [
//         _buildPrayerCard('Esther Howard', 'Hopefully Audrey can get surgery soon...'),
//         _buildPrayerCard('Robert Fox', 'Prayers for a successful surgery...'),
//       ],
//     );
//   }
//
//   Widget _buildPrayerCard(String name, String message) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       margin: EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: Colors.grey[850],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(child: Icon(Icons.person)),
//           SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
//                 Text(message),
//               ],
//             ),
//           ),
//           Icon(Icons.more_vert),
//         ],
//       ),
//     );
//   }
// }
