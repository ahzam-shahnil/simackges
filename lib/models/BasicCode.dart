class BasicCode {
  final int? no;
  final String code;
  final String? sms;
  final String? charges;
  final String network;

  BasicCode({
    this.no,
    required this.code,
    this.sms,
    this.charges,
    required this.network,
  });
  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'code': code,
      'sms': sms,
      'charges': charges,
      'network': network,
    };
  }
}
