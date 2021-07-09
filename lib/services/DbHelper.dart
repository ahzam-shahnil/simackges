import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:simackges/controller/FavColorController.dart';
import 'package:simackges/models/BasicCode.dart';
import 'package:simackges/models/Offers.dart';
import 'package:simackges/models/Packages.dart';
import 'package:simackges/widgets/CustomSnackBar.dart';

class DBHelper {
  static Database? _db;

  //? Instances declared
  CustomSnackBar _snackBar = CustomSnackBar();

  Future<void> openDb() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "allsim.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "sims.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    }
    // open the database
    _db = await openDatabase(path, readOnly: false);
  }

  Future<List<Offers>> getOffersList({required int network}) async {
    await openDb();
    final List<Map<dynamic, dynamic>> maps = await _db!
        .query('OFFERS', where: 'sim=?', whereArgs: [network.toString()]);
    return List.generate(maps.length, (i) {
      return Offers(
        no: maps[i]['no'],
        name: maps[i]['name'],
        pic: maps[i]['pic'],
        sim: maps[i]['sim'],
      );
    });
  }

  Future<List<BasicCode>> getBasicCodeList({required int network}) async {
    await openDb();
    final List<Map<dynamic, dynamic>> maps = await _db!.query('BASICCODES',
        where: 'network=?', whereArgs: [network.toString()]);
    return List.generate(maps.length, (i) {
      return BasicCode(
        no: maps[i]['no'],
        code: maps[i]['code'],
        sms: maps[i]['sms'],
        charges: maps[i]['charges'],
        network: maps[i]['network'],
      );
    });
  }

  Future<int> insertFavourite(Packages package) async {
    await openDb();
    int _id = -1;
    bool isPresent =
        await checkFavouriteList(name: package.name, network: package.network);
    if (isPresent) {
      await _db!.delete('FAVORITE',
          where: "network=? and name LIKE ?",
          whereArgs: [package.network, '${package.name}']);
      _snackBar.snackBar(
        msg: "Offer is removed from favourite.",
      );
    } else {
      _snackBar.snackBar(
        msg: "Offer is saved in favourite.",
      );
      _id = await _db!.insert('FAVORITE', package.toMap());
    }
    Get.find<FavColorController>(tag: 'yes').changeColor();
    return _id;
  }

  Future<void> deleteFavourite() async {
    try {
      await openDb();
      await _db!.delete(
        'FAVORITE',
      );
    } catch (e) {
      print(e);
    }
  }

  Future<bool> checkFavouriteList(
      {required String name, required String network}) async {
    await openDb();
    final List<Map<dynamic, dynamic>> maps = await _db!.rawQuery(
        "SELECT * from FAVORITE where network=? and name LIKE ?;",
        [network.toString(), '$name']);

    if (maps.length > 0)
      return true;
    else
      return false;
  }

  Future<List<Packages>> getFavouriteList({required int network}) async {
    await openDb();
    final List<Map<dynamic, dynamic>> maps = await _db!.rawQuery(
        "SELECT * from FAVORITE where network=? ;", [network.toString()]);

    return List.generate(maps.length, (i) {
      return Packages(
        no: maps[i]['no'].toString(),
        name: maps[i]['name'],
        sms: maps[i]['sms'],
        onnet: maps[i]['onnet'],
        network: maps[i]['network'],
        offnet: maps[i]['offnet'],
        mbs: maps[i]['mbs'],
        validity: maps[i]['validity'].toString(),
        price: maps[i]['price'],
        send: maps[i]['send'],
        activate: maps[i]['activate'],
        deactivate: maps[i]['deactivate'],
        detail: maps[i]['detail'],
        pic: maps[i]['pic'],
        offer: maps[i]['offer'],
      );
    });
  }

  Future<List<Packages>> getPackagesList(
      {required int network, required int offer}) async {
    await openDb();
    final List<Map<dynamic, dynamic>> maps = await _db!.rawQuery(
        "SELECT * from PACKAGES where network=? and offer=?;",
        [network.toString(), offer]);

    return List.generate(maps.length, (i) {
      return Packages(
        no: maps[i]['no'].toString(),
        name: maps[i]['name'],
        sms: maps[i]['sms'],
        onnet: maps[i]['onnet'],
        network: maps[i]['network'],
        offnet: maps[i]['offnet'],
        mbs: maps[i]['mbs'],
        validity: maps[i]['validity'].toString(),
        price: maps[i]['price'],
        send: maps[i]['send'],
        activate: maps[i]['activate'],
        deactivate: maps[i]['deactivate'],
        detail: maps[i]['detail'].toString(),
        pic: maps[i]['pic'],
        offer: maps[i]['offer'],
      );
    });
  }

  Future<List<Packages>> searchFavouriteList(
      {required int network, required String name}) async {
    await openDb();
    final List<Map<dynamic, dynamic>> maps = await _db!.query('FAVORITE',
        where: "network=? AND name LIKE ?",
        whereArgs: [network.toString(), '%$name%']);
    return List.generate(maps.length, (i) {
      return Packages(
        no: maps[i]['no'],
        name: maps[i]['name'],
        sms: maps[i]['sms'],
        onnet: maps[i]['onnet'],
        network: maps[i]['network'],
        offnet: maps[i]['offnet'],
        mbs: maps[i]['mbs'],
        validity: maps[i]['validity'].toString(),
        price: maps[i]['price'],
        send: maps[i]['send'],
        activate: maps[i]['activate'],
        deactivate: maps[i]['deactivate'],
        detail: maps[i]['detail'],
        pic: maps[i]['pic'],
        offer: maps[i]['offer'],
      );
    });
  }

  Future<List<Packages>> searchPackagesList(
      {required int network, required int offer, required String name}) async {
    await openDb();
    final List<Map<dynamic, dynamic>> maps = await _db!.query('PACKAGES',
        where: "network=? AND offer=? AND name LIKE ?",
        whereArgs: [network.toString(), offer, '%$name%']);
    return List.generate(maps.length, (i) {
      return Packages(
        no: maps[i]['no'],
        name: maps[i]['name'],
        sms: maps[i]['sms'],
        onnet: maps[i]['onnet'],
        network: maps[i]['network'],
        offnet: maps[i]['offnet'],
        mbs: maps[i]['mbs'],
        validity: maps[i]['validity'].toString(),
        price: maps[i]['price'],
        send: maps[i]['send'],
        activate: maps[i]['activate'],
        deactivate: maps[i]['deactivate'],
        detail: maps[i]['detail'],
        pic: maps[i]['pic'],
        offer: maps[i]['offer'],
      );
    });
  }
}
