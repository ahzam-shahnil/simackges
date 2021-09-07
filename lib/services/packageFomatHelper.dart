String formatValidity({String? validity}) {
  return validity == null
      ? '--'
      : validity.contains('.')
          ? int.tryParse(validity.substring(validity.indexOf('.') + 1))
                  .toString() +
              ' Hour'
          : validity.contains('null')
              ? '--'
              : int.parse(validity) >= 30
                  ? (int.parse(validity) ~/ 30).toString() + ' Month'
                  : validity + ' Day';
}

String formatPackageDetails({String? details}) {
  return details == null ? '--' : details;
}
