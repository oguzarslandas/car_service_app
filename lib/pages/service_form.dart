import 'package:flutter/material.dart';
import 'package:flutter_car_service/models/service_models.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/service.dart';
import '../style/color.dart';

class ServiceFormPage extends StatefulWidget {
  const ServiceFormPage({super.key});

  @override
  State<ServiceFormPage> createState() => _ServiceFormPageState();
}

class _ServiceFormPageState extends State<ServiceFormPage> {
  List<ServiceModels> serviceDataForm = [];

  List<ServiceModels> selectedService = [];

  @override
  void initState() {
    super.initState();
    serviceDataForm = serviceData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: blackAccent,
          ),
          title: Text(
            "Servis Formu",
            style: GoogleFonts.poppins(
                color: blackAccent, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          actions: [SizedBox()],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: subText.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Araç Detayı",
                        style: GoogleFonts.poppins(
                            color: blackAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Araç Markası",
                            style: GoogleFonts.poppins(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Honda",
                            style: GoogleFonts.poppins(
                                color: blackAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Araç Modeli",
                            style: GoogleFonts.poppins(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Civic",
                            style: GoogleFonts.poppins(
                                color: blackAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Araç Plakası",
                            style: GoogleFonts.poppins(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "33 ADG 183",
                            style: GoogleFonts.poppins(
                                color: blackAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Servis Listesi",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: subText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: serviceDataForm.length == 0
                          ? 1
                          : serviceDataForm.length,
                      itemBuilder: ((context, index) {
                        return serviceDataForm.isEmpty
                            ? Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check_rounded,
                                        color: mainColor,
                                        size: 40,
                                      ),
                                      Text(
                                        "Tüm Hizmetler Seçildi",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            color: mainColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedService.add(ServiceModels(
                                        id: serviceDataForm[index].id,
                                        logo: serviceDataForm[index].logo));
                                    serviceDataForm.removeAt(index);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: mainColor),
                                  child: Image.asset(
                                    serviceDataForm[index].logo.toString(),
                                    height: 20,
                                    width: 40,
                                  ),
                                ),
                              );
                      })),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "Yaptırmak istediğiniz servisi seçin ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: subText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedService.length == 0
                          ? 1
                          : selectedService.length,
                      itemBuilder: ((context, index) {
                        return selectedService.isEmpty
                            ? Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.close,
                                        color: mainColor,
                                        size: 40,
                                      ),
                                      Text(
                                        "Hiçbir Hizmet Seçilmedi",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            color: mainColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    serviceDataForm.add(ServiceModels(
                                        id: selectedService[index].id,
                                        logo: selectedService[index].logo));
                                    selectedService.removeAt(index);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: mainColor),
                                  child: Image.asset(
                                    selectedService[index].logo.toString(),
                                    height: 20,
                                    width: 40,
                                  ),
                                ),
                              );
                      })),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: subText.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Servis Detayı",
                        style: GoogleFonts.poppins(
                            color: blackAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Servis Tarihi",
                            style: GoogleFonts.poppins(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(children: [
                            Text(
                              "15 Ocak 2022",
                              style: GoogleFonts.poppins(
                                  color: blackAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.today,
                              color: mainColor,
                            )
                          ])
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Servis Tipi",
                            style: GoogleFonts.poppins(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Rutin Kontrol",
                            style: GoogleFonts.poppins(
                                color: blackAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tahmini süre",
                            style: GoogleFonts.poppins(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "4 saat 25 dk",
                            style: GoogleFonts.poppins(
                                color: blackAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Servis Görevlisi",
                            style: GoogleFonts.poppins(
                                color: subText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Ali Yılmaz",
                            style: GoogleFonts.poppins(
                                color: blackAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      splashColor: subText,
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "FORMU GÖNDER",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ));
  }
}
