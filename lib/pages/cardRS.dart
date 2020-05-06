// Padding(
//                           padding:
//                               const EdgeInsets.only(left: 25.0, right: 25.0),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Text(
//                                 'Rumah Sakit Rujukan',
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.poppins(
//                                   textStyle: TextStyle(
//                                     color: Color(0xFF180A05),
//                                   ),
//                                   fontSize: 18,
//                                   fontStyle: FontStyle.normal,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               IconButton(
//                                 icon: Icon(
//                                   Icons.keyboard_arrow_right,
//                                   size: 40.0,
//                                 ),
//                                 color: Color(0xFF837ACF),
//                                 onPressed: () {
//                                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                       builder: (context) => MapRS(),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height / 4,
//                           width: MediaQuery.of(context).size.height * 2 / 3,
//                           child: PageView.builder(
//                             itemCount: 4,
//                             controller: PageController(viewportFraction: 0.7),
//                             onPageChanged: (int index) =>
//                                 setState(() => _index = index),
//                             itemBuilder: (_, i) {
//                               return Transform.scale(
//                                 scale: i == _index ? 1 : 0.9,
//                                 child: Card(
//                                   semanticContainer: true,
//                                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                                   elevation: 2,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20)),
//                                   child: Stack(
//                                     children: <Widget>[
//                                       Container(
//                                         height: double.infinity,
//                                         width: double.infinity,
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                             image: AssetImage(
//                                                 'assets/images/Hospital.png'),
//                                           ),
//                                         ),
//                                       ),
//                                       Positioned.fill(
//                                         top:
//                                             MediaQuery.of(context).size.height *
//                                                 2 /
//                                                 10,
//                                         child: Text(
//                                           rumahsakit[i],
//                                           textAlign: TextAlign.center,
//                                           style: GoogleFonts.poppins(
//                                             textStyle: TextStyle(
//                                                 color: Color(0xFF837ACF)),
//                                             fontSize: 20,
//                                             fontStyle: FontStyle.normal,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),