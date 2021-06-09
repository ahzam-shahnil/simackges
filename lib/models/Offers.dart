class Offers {
  final int no;
  final String name;
  final String pic;
  final String sim;

  Offers({
    required this.no,
    required this.name,
    required this.pic,
    required this.sim,
  });
  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'name': name,
      'pic': pic,
      'sim': sim,
    };
  }
}
