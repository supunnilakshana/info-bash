


// Column(
//   children: [
// Padding(
//   padding: EdgeInsets.only(
//       left: size.width * 0.075,
//       right: size.width * 0.075,
//       top: size.height * 0.015),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: const EdgeInsets.all(5),
//         child: Text(
//           "Batmens ",
//           style: rtitelStyle,
//         ),
//       ),
//       Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding:
//               const EdgeInsets.only(left: 10, right: 10),
//           child: SizedBox(
//             width: size.width * 0.9,
//             child: DropdownButton<String>(
//               isExpanded: true,
//               value: bat1nameValue,
//               icon: const Icon(Icons.arrow_downward),
//               elevation: 16,
//               style: const TextStyle(color: Colors.black),
//               underline: Container(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   bat1nameValue = newValue!;
//                   print(bat1nameValue);
//                 });
//               },
//               items: <String>[
//                 'Select Bat 1',
//                 'Supun Nilakshanar',
//                 'Dilshan Kumara',
//                 'Shagan Nimesh',
//               ].map<DropdownMenuItem<String>>(
//                   (String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//       ),
//       Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding:
//               const EdgeInsets.only(left: 10, right: 10),
//           child: SizedBox(
//             width: size.width * 0.9,
//             child: DropdownButton<String>(
//               isExpanded: true,
//               value: bat2nameValue,
//               icon: const Icon(Icons.arrow_downward),
//               elevation: 16,
//               style: const TextStyle(color: Colors.black),
//               underline: Container(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   bat2nameValue = newValue!;
//                 });
//               },
//               items: <String>[
//                 'Select Bat 2',
//                 'Supun Nilakshanar',
//                 'Dilshan Kumara',
//                 'Shagan Nimesh',
//               ].map<DropdownMenuItem<String>>(
//                   (String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
// Padding(
//   padding: EdgeInsets.only(
//       left: size.width * 0.075,
//       right: size.width * 0.075,
//       top: size.height * 0.015),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: const EdgeInsets.all(5),
//         child: Text(
//           "Bowler ",
//           style: rtitelStyle,
//         ),
//       ),
//       Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding:
//               const EdgeInsets.only(left: 10, right: 10),
//           child: SizedBox(
//             width: size.width * 0.9,
//             child: DropdownButton<String>(
//               isExpanded: true,
//               value: bownameValue,
//               icon: const Icon(Icons.arrow_downward),
//               elevation: 16,
//               style: const TextStyle(color: Colors.black),
//               underline: Container(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   bownameValue = newValue!;
//                   print(bownameValue);
//                 });
//               },
//               items: <String>[
//                 'Select Bowler',
//                 'Supun Nilakshanar',
//                 'Dilshan Kumara',
//                 'Shagan Nimesh',
//               ].map<DropdownMenuItem<String>>(
//                   (String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
// Row(
//   children: [
//     Expanded(
//       child: ListTile(
//         title: Text(
//           bat1nameValue,
//           style: rtitelStyle,
//         ),
//         leading: Radio(
//           value: Idelivertype.wide,
//           groupValue: bat1id,
//           activeColor: kPrimaryColordark,
//           onChanged: (value) {
//             setState(() {
//               bat1id = value.toString();
//             });
//           },
//         ),
//       ),
//     ),
//     Expanded(
//       child: ListTile(
//         title: Text(
//           bat2nameValue,
//           style: rtitelStyle,
//         ),
//         leading: Radio(
//           value: Idelivertype.noball,
//           groupValue: bat2id,
//           activeColor: kPrimaryColordark,
//           onChanged: (value) {
//             setState(() {
//               bat2id = value.toString();
//             });
//           },
//         ),
//       ),
//     ),
//   ],
// ),
//   ],
// ),
// String bat1id = "";
//   String bat2id = "";
//   String bowid = "";
//   String bat1nameValue = 'Select Bat 1';
//   String bat2nameValue = 'Select Bat 2';
//   String bownameValue = 'Select Bowler';