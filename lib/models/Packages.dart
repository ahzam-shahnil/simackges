class Packages {
  final String? no;
  final String name;
  final String? onnet;
  final String? offnet;
  final String? sms;
  final String? mbs;
  final String? validity;
  final String? price;
  final String? send;
  final String? activate;
  final String? deactivate;
  final String detail;
  final String pic;
  final int offer;
  final String network;

  Packages({
    this.no,
    required this.name,
    this.onnet,
    this.offnet,
    this.sms,
    this.mbs,
    this.validity,
    this.price,
    this.send,
    this.activate,
    this.deactivate,
    required this.detail,
    required this.pic,
    required this.offer,
    required this.network,
  });

  Map<String, dynamic> toMap() {
    return {
      'no': no.toString(),
      'name': name,
      'onnet': onnet,
      'offnet': offnet,
      'sms': sms,
      'mbs': mbs,
      'validity': validity.toString(),
      'price': price,
      'send': send,
      'activate': activate,
      'deactivate': deactivate,
      'detail': detail,
      'pic': pic,
      'offer': offer,
      'network': network,
    };
  }
}
