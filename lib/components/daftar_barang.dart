import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:stock_ops/data/models/database.dart';
import 'package:stock_ops/pages/detail_barang_page.dart';
import 'package:stock_ops/pages/edit_barang_page.dart';
import 'package:stock_ops/theme/theme.dart';

class CardBarang extends StatefulWidget {
  const CardBarang({super.key});

  @override
  State<CardBarang> createState() => _CardBarangState();
}

class _CardBarangState extends State<CardBarang> {
  // memanggil database
  final AppDb database = AppDb();
  // untuk memanggil function di database.dart yang telah dibuat

  Future<List<Stuff>> getAllStuff() async {
    return await database.getAllStuffRepo();
  }

  @override
  Widget build(BuildContext context) {
    // untuk melihat hasil dari list
    // melakukan debug
    getAllStuff().then((listOfStuff) {
      // Menampilkan semua nilai pada listOfStuff
      for (var stuff in listOfStuff) {
        print(stuff.id);
      }
    }).catchError((error) {
      // Menangani error jika terjadi
      print('Terjadi error: $error');
    });

    return FutureBuilder<List<Stuff>>(
      future: getAllStuff(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            if (snapshot.data!.length > 0) {
              // return Text(
              //   "Ada Data Total : ${snapshot.data!.length}",
              // );
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 2,
                    mainAxisExtent: 34,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 2),
                      padding: const EdgeInsets.only(
                        left: 14,
                        right: 14,
                        top: 8,
                        bottom: 5,
                      ),
                      height: 34,
                      decoration: BoxDecoration(
                        color: const Color(0xffD8C4B6),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, '/detailBarang-page');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return DetailBarang(
                                      id_barang: snapshot.data![index].id,
                                    );
                                  }),
                                );
                              },
                              child: Text(
                                snapshot.data![index].nama_barang,
                                style: primaryTextStyle.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // melakukan seting untuk update disini
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return EditBarangPage(
                                  id_barang: snapshot.data![index].id,
                                );
                              }));
                            },
                            child: Image.asset(
                              'assets/icons/icon_pensil.png',
                              width: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text("Tidak Ada Data"),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Terjadi kesalahan: ${snapshot.error}"),
            );
          } else {
            return Center(
              child: Text("Tidak Ada Data"),
            );
          }
        }
      },
    );

    //           ,GridView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 1,
    //     crossAxisSpacing: 2,
    //     mainAxisExtent: 34,
    //   ),
    //   itemCount: listBarang.length,
    //   itemBuilder: (_, index) {
    //     return Container(
    //       width: double.infinity,
    //       margin: const EdgeInsets.only(top: 2),
    //       padding: const EdgeInsets.only(
    //         left: 14,
    //         right: 14,
    //         top: 8,
    //         bottom: 7,
    //       ),
    //       height: 34,
    //       decoration: BoxDecoration(
    //         color: const Color(0xffD8C4B6),
    //         borderRadius: BorderRadius.circular(5),
    //       ),
    //       child: Row(
    //         children: [
    //           Expanded(
    //             child: GestureDetector(
    //               onTap: () {
    //                 Navigator.pushNamed(context, '/detailBarang-page');
    //               },
    //               child: Text(
    //                 '${listBarang.elementAt(index)['title']}',
    //                 style: primaryTextStyle.copyWith(
    //                     fontSize: 15, fontWeight: FontWeight.w400),
    //               ),
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pushNamed(context, '/editBarang-page');
    //             },
    //             child: Image.asset(
    //               '${listBarang.elementAt(index)['icons']}',
    //               width: 14,
    //             ),
    //           ),

    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
