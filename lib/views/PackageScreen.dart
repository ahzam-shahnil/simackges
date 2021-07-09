import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simackges/controller/FavColorController.dart';

import 'package:simackges/services/DbHelper.dart';
import 'package:simackges/services/constants.dart';
import 'package:simackges/models/Packages.dart';
import 'package:simackges/widgets/PackageCard.dart';

class PackageScreen extends StatefulWidget {
  PackageScreen({
    required this.title,
    required this.backColor,
    required this.network,
    this.offerNo,
    required this.isFavourite,
  });

  static List<Packages> packagesList = [];

  final Color backColor;
  final int network;
  final int? offerNo;
  final String title;

  //? var  isFavourite is used to diferentiate b/w favourite list call and packages screen list call
  //* basically we are using the same screen for two different functions
  //* for that isFavourite is used
  final bool isFavourite;

  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  bool isFocused = false;

  // to check if the search is empty
  bool isSearchEmpty = true;

  final DBHelper _dbHelper = DBHelper();
  late TextEditingController _searchController;
  final searchFocusNode = FocusNode();
  // ? Initializing Fav Controller here
  final controller =
      Get.lazyPut(() => FavColorController(), fenix: true, tag: 'yes');

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _searchController = TextEditingController();

    _searchController.addListener(_setLatestSearch);
    super.initState();
  }

  _setLatestSearch() {
    if (_searchController.text.trim().isNotEmpty) {
      setState(() {
        isSearchEmpty = false;
      });
    } else {
      setState(() {
        isSearchEmpty = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //variables for usage
    var height = MediaQuery.of(context).size.height;

    var packageItemTstyle = TextStyle(
      color: widget.backColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );

    return Scaffold(
      backgroundColor: widget.backColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: isFocused != true
            ? Text(
                widget.title,
                style: kWhiteTextStyle,
              )
            : Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        autofocus: isFocused,
                        focusNode: searchFocusNode,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.white38),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        backgroundColor: widget.backColor,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () => setState(() {
              isFocused = true;
            }),
          ),
          widget.isFavourite
              ? IconButton(
                  onPressed: () => _dbHelper.deleteFavourite().then((value) {
                        setState(() {});
                      }),
                  icon: Icon(Icons.delete_rounded))
              : Container(
                  height: 0,
                  width: 0,
                )
        ],
      ),

      //* here all the packages are displayed
      body: WillPopScope(
        onWillPop: () async {
          if (searchFocusNode.hasFocus) {
            FocusScope.of(context).unfocus();
          }
          return true;
        },
        child: FutureBuilder(
          future: isSearchEmpty
              ? widget.isFavourite
                  ? _dbHelper.getFavouriteList(network: widget.network)
                  : _dbHelper.getPackagesList(
                      network: widget.network, offer: widget.offerNo!)
              : widget.isFavourite
                  ? _dbHelper.searchFavouriteList(
                      network: widget.network,
                      name: _searchController.text.trim())
                  : _dbHelper.searchPackagesList(
                      network: widget.network,
                      offer: widget.offerNo!,
                      name: _searchController.text.trim()),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              PackageScreen.packagesList = snapshot.data;
              return PackageCard(
                packagesList: PackageScreen.packagesList,
                height: height,
                backColor: widget.backColor,
                packageItemTstyle: packageItemTstyle,
                title: widget.title,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
